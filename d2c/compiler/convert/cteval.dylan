module: compile-time-eval
rcs-header: $Header: /home/housel/work/rcs/gd/src/d2c/compiler/convert/cteval.dylan,v 1.13 1995/12/15 16:16:36 wlott Exp $
copyright: Copyright (c) 1994  Carnegie Mellon University
	   All rights reserved.


// ct-eval and ct-mv-eval

// ct-eval -- exported.
//
// Return the <ct-value> for the result of evaluating expr in lexenv if it
// is a compile-time constant.  Otherwise, return #f.  We only use lexenv
// to tell when a constant module variable has been locally shadowed.
//
define generic ct-eval (expr :: <constituent>,
			lexenv :: false-or(<lexenv>))
    => res :: false-or(<ct-value>);

// ct-mv-eval -- exported.
//
// Like ct-eval, but return all the values.
// 
define generic ct-mv-eval (expr :: <constituent>,
			   lexenv :: false-or(<lexenv>));


// ct-eval(<constituent>,...) -- exported method.
//
// Just call ct-mv-eval and return the first result, if there is one.
// Otherwise return the compile-time literal for #f, because the expression
// constantly returns no values.
// 
define method ct-eval (expr :: <constituent>,
		       lexenv :: false-or(<lexenv>))
    => res :: false-or(<ct-value>);
  let (#rest results) = ct-mv-eval(expr, lexenv);
  if (empty?(results))
    make(<literal-false>);
  else
    results[0];
  end;
end;


// ct-mv-eval(<constituent>, <lexenv>) -- exported method.
//
// The default method just retries with the expansion if there is one, and
// bails if not.
// 
define method ct-mv-eval (expr :: <constituent>,
			  lexenv :: false-or(<lexenv>))
  let (expansion) = expand(expr, lexenv);
  if (expansion)
    ct-mv-eval-body(expansion, lexenv);
  else
    #f;
  end;
end;

// ct-mv-eval(<literal-ref>, <lexenv>) -- exported method.
//
// Just return a compile-time literal.
//
define method ct-mv-eval (expr :: <literal-ref>,
			  lexenv :: false-or(<lexenv>))
    => res :: <ct-value>;
  expr.litref-literal;
end;

// ct-mv-eval(<varref>, <lexenv>) -- exported method.
//
// As long as the variable isn't bound in the lexenv, call ct-value on the
// definition (assuming there is one).
//
define method ct-mv-eval (expr :: <varref>,
			  lexenv :: false-or(<lexenv>))
    => res :: false-or(<ct-value>);
  let id = expr.varref-id;
  unless (lexenv & find-binding(lexenv, id))
    let var = find-variable(id-name(id));
    var & var.variable-definition & ct-value(var.variable-definition);
  end;
end;

// ct-mv-eval(<funcall>, <lexenv>) -- exported method.
//
// If there is an expansion, eval it.  Otherwise, check it see if it is one
// of the functions we know something about.
// 
define method ct-mv-eval (expr :: <funcall>,
			  lexenv :: false-or(<lexenv>))
  let (expansion) = expand(expr, lexenv);
  if (expansion)
    ct-mv-eval-body(expansion, lexenv);
  else
    ct-mv-eval-funcall(expr.funcall-function, expr.funcall-arguments, lexenv);
  end;
end;

// ct-mv-eval(<dot>, <lexenv>) -- exported method.
//
// If there is an expansion, eval it.  Otherwise, check it see if it is one
// of the functions we know something about.
// 
define method ct-mv-eval (expr :: <dot>,
			  lexenv :: false-or(<lexenv>))
  let (expansion) = expand(expr, lexenv);
  if (expansion)
    ct-mv-eval-body(expansion, lexenv);
  else
    ct-mv-eval-funcall(expr.dot-name, vector(expr.dot-operand), lexenv);
  end;
end;

// ct-mv-eval(<begin>, <lexenv>) -- exported method.
//
// Just eval the body.
//
define method ct-mv-eval (expr :: <begin>,
			  lexenv :: false-or(<lexenv>))
  ct-mv-eval-body(expr.begin-body, lexenv);
end;


// ct-mv-eval-body -- internal.
//
// Eval the body, and return the results of the last form.  We make sure all
// the intervening forms return a compile-time constant value, because we
// that is the best guess we can make about them not having side effects.
//
define method ct-mv-eval-body (body :: <simple-object-vector>,
			       lexenv :: false-or(<lexenv>))
  if (empty?(body))
    make(<literal-false>);
  else
    block (return)
      let last = body.size - 1;
      for (i from 0 below last)
	unless (ct-eval(body[i], lexenv))
	  return(#f);
	end;
      end;
      ct-mv-eval(body[last], lexenv);
    end;
  end;
end;

// ct-mv-eval-function -- internal.
//
// If the function is one of the ones we know about, deal with it.  If not,
// then return #f.
//
define generic ct-mv-eval-funcall
    (function :: type-union(<expression>, <identifier-token>),
     args :: <simple-object-vector>,
     lexenv :: false-or(<lexenv>));

// ct-mv-eval-function -- internal method
//
// Give up because the function expression is something we can't deal with.
//
define method ct-mv-eval-funcall (function :: <expression>,
				  args :: <simple-object-vector>,
				  lexenv :: false-or(<lexenv>))
  #f;
end;

// ct-mv-eval-function -- internal method
//
// The function is a varref, so just try again directly on the name.
//
define method ct-mv-eval-funcall (function :: <varref>,
				  args :: <simple-object-vector>,
				  lexenv :: false-or(<lexenv>))
  ct-mv-eval-funcall(function.varref-id, args, lexenv);
end;

// ct-mv-eval-funcall -- internal
//
// If the name has been shadowed, give up.  Otherwise, look it up and see
// if it is any of the functions we magically know about.  If so, compute
// the result and return it.
// 
define method ct-mv-eval-funcall
    (function :: <identifier-token>, args :: <simple-object-vector>,
     lexenv :: false-or(<lexenv>))
  if (lexenv & find-binding(lexenv, function))
    #f;
  else
    let var = find-variable(id-name(function));
    if (var)
      let evaluator = var.variable-ct-evaluator;
      if (evaluator)
	block (return)
	  let args = map(method (arg :: <expression>)
			     => res :: <ct-value>;
			   ct-eval(arg, lexenv) | return(#f)
			 end,
			 args);
	  apply(evaluator, args);
	end block;
      else
	#f;
      end if;
    else
      #f;
    end if;
  end if;
end method ct-mv-eval-funcall;


// compile-time evaluation methods for various functions.


define method define-ct-evaluator
    (name :: <symbol>, specializers :: <list>, body :: <function>) => ();
  let var = dylan-var(name, create: #t);
  var.variable-ct-evaluator
    := method (#rest args)
	 let specializers
	   = map(method (specifier :: type-union(<type-specifier>,
					      singleton(#"rest")))
		     => res :: type-union(<ctype>, singleton(#"rest"));
		   if (specifier == #"rest")
		     #"rest";
		   else
		     specifier-type(specifier);
		   end;
		 end,
		 specializers);
	 let new-evaluator
	   = method (#rest args)
	       block (return)
		 let remaining = specializers;
		 for (arg :: <ct-value> in args)
		   if (remaining == #())
		     return(#f);
		   else
		     let specializer = remaining.head;
		     if (specializer == #"rest")
		       unless (cinstance?(arg, remaining.tail.head))
			 return(#f);
		       end;
		     else
		       unless (cinstance?(arg, specializer))
			 return(#f);
		       end;
		       remaining := remaining.tail;
		     end if;
		   end if;
		 end for;
		 if (remaining == #() | remaining.head == #"rest")
		   apply(body, args);
		 else
		   #f;
		 end;
	       end block;
	     end method;
	 var.variable-ct-evaluator := new-evaluator;
	 apply(new-evaluator, args);
       end;
end;

define method ct-keywords (args :: <simple-object-vector>, #rest keys)
    => (okay :: <boolean>, #rest values);
  block (return)
    unless (even?(args.size))
      return(#f);
    end;
    for (index from 0 below args.size by 2)
      let ct-key = args[index];
      unless (instance?(ct-key, <literal-symbol>)
		& member?(ct-key.literal-value, keys))
	return(#f);
      end;
    end;
    apply(values,
	  #t,
	  map(method (key)
		block (found)
		  for (index from 0 below args.size by 2)
		    if (args[index] = key)
		      found(args[index + 1]);
		    end;
		  end;
		  #f;
		end;
	      end,
	      keys));
  end;
end;

define method ct-eval-rational-function (function :: <function>, #rest args)
    => res :: false-or(<literal-rational>);
  let any-ratios? = #f;
  let any-bignums? = #f;
  for (arg in args)
    select (arg by instance?)
      <literal-ratio> => any-ratios? := #t;
      <literal-extended-integer> => any-bignums? := #t;
      <literal-fixed-integer> => #f;
      otherwise =>
	error("ct-eval-ration-function call on non-rational?");
    end select;
  end for;
  make(if (any-ratios?)
	 <literal-ratio>;
       elseif (any-bignums?)
	 <literal-extended-integer>;
       else
	 <literal-fixed-integer>;
       end,
       value: apply(function, map(literal-value, args)));
end;



define-ct-evaluator(#"singleton", #(#"<object>"),
		    method (object :: <ct-value>)
			=> res :: false-or(<ct-value>);
		      if (instance?(object, <eql-ct-value>))
			make-canonical-singleton(object);
		      else
			#f;
		      end;
		    end);

define-ct-evaluator(#"type-union", #(rest:, #"<type>"),
		    method (#rest types) => res :: <ctype>;
		      reduce(ctype-union, empty-ctype(), types);
		    end);
		      
define-ct-evaluator(#"false-or", #(#"<type>"),
		    method (type :: <ctype>) => res :: <ctype>;
		      ctype-union(type, specifier-type(#"<false>"));
		    end);

define-ct-evaluator(#"one-of", #(rest:, #"<object>"),
		    method (#rest objects) => res :: false-or(<ctype>);
		      if (every?(rcurry(instance?, <eql-ct-value>), objects))
			reduce(ctype-union, empty-ctype(),
			       map(make-canonical-singleton, objects));
		      else
			#f;
		      end;
		    end method);

define-ct-evaluator
  (#"limited", #(#"<class>", rest:, #"<object>"),
   method (class :: <cclass>, #rest keys)
       => res :: false-or(<ctype>);
     select (class by csubtype?)
       dylan-value(#"<integer>") =>
	 let (okay, min, max) = ct-keywords(keys, #"min", #"max");
	 if (okay)
	   if ((min == #f | instance?(min, <literal-integer>))
		 & (max == #f | instance?(max, <literal-integer>)))
	     let min = min & min.literal-value;
	     let max = max & max.literal-value;
	     make-canonical-limited-integer(class, min, max);
	   end;
	 end;
       otherwise =>
	 #f;
     end;
   end method);

define-ct-evaluator
  (#"make", #(#"<class>", rest:, #"<object>"),
   method (class :: <cclass>, #rest keys)
       => res :: false-or(<ct-value>);
     select (class)
       dylan-value(#"<singleton>") =>
	 let (okay, object) = ct-keywords(keys, #"object");
	 if (okay & instance?(object, <eql-ct-value>))
	   make-canonical-singleton(object);
	 end;
       dylan-value(#"<byte-character-type>") =>
	 if (ct-keywords(keys))
	   make(<byte-character-ctype>);
	 end;
       dylan-value(#"<not-supplied-marker>") =>
	 if (ct-keywords(keys))
	   make(<ct-not-supplied-marker>);
	 end;
       otherwise =>
	 #f;
     end;
   end method);

define-ct-evaluator(#"negative", #(#"<rational>"),
		    curry(ct-eval-rational-function, negative));

define-ct-evaluator(#"abs", #(#"<rational>"),
		    curry(ct-eval-rational-function, abs));

define-ct-evaluator(#"+", #(#"<rational>", #"<rational>"),
		    curry(ct-eval-rational-function, \+));

define-ct-evaluator(#"-", #(#"<rational>", #"<rational>"),
		    curry(ct-eval-rational-function, \-));

define-ct-evaluator(#"*", #(#"<rational>", #"<rational>"),
		    curry(ct-eval-rational-function, \*));

define-ct-evaluator
  (#"ash", #(#"<integer>", #"<fixed-integer>"),
   curry(ct-eval-rational-function,
	 method (x :: <extended-integer>, y :: <extended-integer>)
	     => res :: <extended-integer>;
	   ash(x, as(<fixed-integer>, y));
	 end));

define-ct-evaluator(#"^", #(#"<integer>", #"<integer>"),
		    curry(ct-eval-rational-function, \^));

define-ct-evaluator(#"logior", #(rest:, #"<integer>"),
		    curry(ct-eval-rational-function, logior));

define-ct-evaluator(#"logior", #(rest:, #"<integer>"),
		    curry(ct-eval-rational-function, logxor));

define-ct-evaluator(#"logior", #(rest:, #"<integer>"),
		    curry(ct-eval-rational-function, logand));

define-ct-evaluator(#"lognot", #(#"<integer>"),
		    curry(ct-eval-rational-function, lognot));
