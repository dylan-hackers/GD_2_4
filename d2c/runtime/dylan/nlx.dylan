rcs-header: $Header: /scm/cvs/src/d2c/runtime/dylan/nlx.dylan,v 1.3 2001/05/14 23:31:15 gabor Exp $
copyright: see below
module: dylan-viscera

//======================================================================
//
// Copyright (c) 1995, 1996, 1997  Carnegie Mellon University
// Copyright (c) 1998, 1999, 2000, 2001  Gwydion Dylan Maintainers
// All rights reserved.
// 
// Use and copying of this software and preparation of derivative
// works based on this software are permitted, including commercial
// use, provided that the following conditions are observed:
// 
// 1. This copyright notice must be retained in full on any copies
//    and on appropriate parts of any derivative works.
// 2. Documentation (paper or online) accompanying any system that
//    incorporates this software, or any part of it, must acknowledge
//    the contribution of the Gwydion Project at Carnegie Mellon
//    University, and the Gwydion Dylan Maintainers.
// 
// This software is made available "as is".  Neither the authors nor
// Carnegie Mellon University make any warranty about the software,
// its performance, or its conformity to any specification.
// 
// Bug reports should be sent to <gd-bugs@gwydiondylan.org>; questions,
// comments and suggestions are welcome at <gd-hackers@gwydiondylan.org>.
// Also, see http://www.gwydiondylan.org/ for updates and documentation. 
//
//======================================================================

define abstract class <unwind-block> (<object>)
  constant slot saved-stack :: <raw-pointer>,
    required-init-keyword: saved-stack:;
  constant slot saved-uwp :: false-or(<unwind-protect>),
    required-init-keyword: saved-uwp:;
  constant slot saved-handler :: false-or(<handler>),
    required-init-keyword: saved-handler:;
end;

define class <unwind-protect> (<unwind-block>)
  constant slot cleanup :: <function>,
    required-init-keyword: cleanup:;
end;

define sealed domain make (singleton(<unwind-protect>));
define sealed domain initialize (<unwind-protect>);

define function push-unwind-protect (cleanup :: <function>) => ();
  let thread = this-thread();
  thread.cur-uwp := make(<unwind-protect>,
			 saved-stack: %%primitive(current-sp),
			 saved-uwp: thread.cur-uwp,
			 saved-handler: thread.cur-handler,
			 cleanup: cleanup);
end;

define function pop-unwind-protect () => ();
  let thread = this-thread();
  thread.cur-uwp := thread.cur-uwp.saved-uwp;
end;

define class <catcher> (<unwind-block>)
  constant slot saved-state :: <raw-pointer>, required-init-keyword: saved-state:;
  slot disabled :: <boolean>, init-value: #f;
  constant slot thread :: <thread>, required-init-keyword: thread:;
end;

define sealed domain make (singleton(<catcher>));
define sealed domain initialize (<catcher>);

define function make-catcher (saved-state :: <raw-pointer>) => res :: <catcher>;
  let thread = this-thread();
  make(<catcher>,
       saved-stack: %%primitive(current-sp),
       saved-uwp: thread.cur-uwp,
       saved-handler: thread.cur-handler,
       saved-state: saved-state,
       thread: thread);
end;

define function make-exit-function (catcher :: <catcher>) => res :: <function>;
  method (#rest args)
    throw(catcher, args);
  end;
end;

define function disable-catcher (catcher :: <catcher>) => ();
  catcher.disabled := #t;
end;


define function catch (saved-state :: <raw-pointer>, thunk :: <function>)
  thunk(saved-state);
end;

define function throw (catcher :: <catcher>, values :: <simple-object-vector>)
    => res :: <never-returns>;
  if (catcher.disabled)
    error("Can't exit to a block that has already been exited from.");
  end;
  let this-thread = this-thread();
  unless (catcher.thread == this-thread)
    error("Can't exit from a block set up by some other thread.");
  end;
  let target-uwp = catcher.saved-uwp;
  let uwp = this-thread.cur-uwp;
  until (uwp == target-uwp)
    %%primitive(unwind-stack, uwp.saved-stack);
    let prev = uwp.saved-uwp;
    this-thread.cur-uwp := prev;
    this-thread.cur-handler := uwp.saved-handler;
    uwp.cleanup();
    uwp := prev;
  end;
  catcher.disabled := #t;
  %%primitive(unwind-stack, catcher.saved-stack);
  this-thread.cur-handler := catcher.saved-handler;
  // Note: the values-sequence has to happen after the unwind-stack.
  %%primitive(throw, catcher.saved-state, catcher.saved-stack, values-sequence(values));
end;
