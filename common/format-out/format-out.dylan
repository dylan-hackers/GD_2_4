module: Format-out
author: David Watson (dwatson@cmu.edu)
synopsis: The Format-Out library.
rcs-header: $Header: /home/housel/work/rcs/gd/src/common/format-out/format-out.dylan,v 1.3 1996/07/18 11:35:31 dwatson Exp $

//======================================================================
//
// Copyright (c) 1996  Carnegie Mellon University
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

define sealed inline method format-out
    (control-string :: <byte-string>, #rest args)
 => ();
  apply(format, *standard-output*, control-string, args);
end method format-out;