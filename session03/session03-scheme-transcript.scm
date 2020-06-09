Chez Scheme Version 9.5.3
Copyright 1984-2019 Cisco Systems, Inc.

> (define fives (cons 5 fives))

Exception: variable fives is not bound
Type (debug) to enter the debugger.
> (define fives (cons 5 '()))
> fives
(5)
> (set-cdr! fives fives)
> fives

Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
#0=(5 . #0#)
> (pair? fives)
#t
> (list? fives)
#f
> (length fives)

Exception in length: (5 5 5 5 5 5 ...) is circular
Type (debug) to enter the debugger.
> (expand '(cond
             ((null? x) #t)
             ((pair? x) (prettiest-proper-list? (cdr x)))
      (else #f)))
(if (#2%null? x)
    #t
    (if (#2%pair? x)
        (prettiest-proper-list? (#2%cdr x))
        #f))
> fives

Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
#0=(5 . #0#)
> (define prettiest-proper-list?
    (lambda (x)
      (cond
        ((null? x) #t)
        ((pair? x) (prettiest-proper-list? (cdr x)))
        (else #f))))
> (prettiest-proper-list? '(5 5 5))
#t
> (prettiest-proper-list? '(5 5 . 5))
#f
> (prettiest-proper-list? fives)
  C-c C-c
break> r
> (trace )
()
> (trace 'prettiest-proper-list?)

Exception: invalid syntax (trace (quote prettiest-proper-list?))
Type (debug) to enter the debugger.
> (trace prettiest-proper-list?)
(prettiest-proper-list?)
> (prettiest-proper-list? '(5 5 5))
|(prettiest-proper-list? (5 5 5))
|(prettiest-proper-list? (5 5))
|(prettiest-proper-list? (5))
|(prettiest-proper-list? ())
|#t
#t
> (prettiest-proper-list? fives)
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-list? #0=(5 . #0#))
|
Warning in pretty-print: cycle detected; proceeding with (print-graph #t)
(prettiest-proper-  C-c C-cr-list? #0=(5 . #0#))
break> r
> (define take
    (lambda (ls n)
      (cond
        ((zero? n) '())
        (else (cons (car ls) (take (cdr ls) (- n 1)))))))
> (take '(5 5 5 5 5 5 5 5) 3)
(5 5 5)
> (take '(a b c d e f g) 5)
(a b c d e)
> (take fives 3)
(5 5 5)
> (take fives 100)
(5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5)
> (take fives 1000)
(5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5)
> (take fives 10000)
(5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
 5 5 5 5 5 5 5 5 5 5)
> (define take
    (lambda (ls n)
      (cond
        ((zero? n) '())
        ((null? ls) '())
        (else (cons (car ls)
                    (take (cdr ls) (- n 1)))))))
> (take '(1 2 3) 10)
(1 2 3)
> (define take
    (lambda (ls n)
      (cond
        ((zero? n) '())
        ((null? ls) '())
        ((pair? ls) (cons (car ls)
                          (take (cdr ls) (- n 1))))
        (else (error 'take "expected a pair")))))
> (take '(1 2 3) 10)
(1 2 3)
> 