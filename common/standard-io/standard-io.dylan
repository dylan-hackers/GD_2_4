module: Standard-io
author: chiles@cs.cmu.edu
synopsis: This file provides some standard I/O stuff.
copyright: See below.
rcs-header: $Header: /home/housel/work/rcs/gd/src/common/standard-io/standard-io.dylan,v 1.1 1996/06/12 23:40:42 bfw Exp $

//======================================================================
//
// Copyright (c) 1994  Carnegie Mellon University
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
//    University.
// 
// This software is made available "as is".  Neither the authors nor
// Carnegie Mellon University make any warranty about the software,
// its performance, or its conformity to any specification.
// 
// Bug reports, questions, comments, and suggestions should be sent by
// E-mail to the Internet address "gwydion-bugs@cs.cmu.edu".
//
//======================================================================

define library Standard-IO
  use Dylan;
  use New-Streams;
  export Standard-IO;
end library;

define module Standard-IO
  use Dylan;
  use New-Streams,
    import: {<fd-stream>};
  export
    *standard-input*, *standard-output*, *standard-error*;
end module;

define constant *standard-input* :: <fd-stream>
  = make(<fd-stream>, fd: 0);

define constant *standard-output* :: <fd-stream>
  = make(<fd-stream>, fd: 1, direction: #"output");

define constant *standard-error* :: <fd-stream>
  = make(<fd-stream>, fd: 2, direction: #"output");