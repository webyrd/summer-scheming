#lang racket

;; recursion on lists

;; A proper list is either:
;; 1. the empty list   '()
;; 2. or a cons pair whose cdr is a proper list.

;; examples of proper lists:
'()
(cons 3 '())
(cons 3 (cons 4 '()))
(cons (cons 3 4) '())

;; examples of things that are not proper lists:
5
(cons 3 4)
#t
(cons '() 3)



; (proper-list? x) => #f or #f

; proper list takes any Scheme or Racket object 'x' and returns #t if 'x' is
; a proper list, and #f otherwise

(define proper-list?
  (lambda (x)
    (if (equal? x '())
        #t
        (if (pair? x)
            (proper-list? (cdr x))
            #f))))

(define prettier-proper-list?
  (lambda (x)
    (cond  ;; McCarthy's conditional operator
      ;; cond syntax:
      ;; (cond
      ;;   (<test-expression> <value-expression>) ;; cond clause
      ;;   ...
      ;;   (else <value-expression>))
      ((equal? x '()) #t)
      ((pair? x) (prettier-proper-list? (cdr x)))
      (else #f))))

;; Will's preferred style
(define prettiest-proper-list?
  (lambda (x)
    (cond
      ((null? x) #t)
      ((pair? x) (prettiest-proper-list? (cdr x)))
      (else #f))))

;; MIT syntax (like in SICP by Abelson and Sussman) -- we won't use this!
(define (alternative-prettiest-proper-list? x)
  (cond
    ((null? x) #t)
    ((pair? x) (alternative-prettiest-proper-list? (cdr x)))
    (else #f)))

(proper-list? '())
(proper-list? (cons 3 '()))
(proper-list? (cons 3 (cons 4 '())))
(proper-list? (cons (cons 3 4) '()))

(proper-list? 5)
(proper-list? (cons 3 4))
(proper-list? #t)
(proper-list? (cons '() 3))



;; More recursive functions over lists!

;; Step 1: write down a few examples, including the base case and a recursive case
;; (the simplest example, and a less simple example)

#|
(list-length '()) ;; => 0              simplest example
(list-length '(a b c d e)) ;; => 5     less simple example
(list-length '(#t #f)) ;; => 2
(list-length '(1 2 3)) ;; => 3
|#

;; Step 2: must the function be recursive?

; Yes!  Because the function must work no matter how long the list is!

; In general, when recurring over lists or trees of arbitrary size, you need recursion!

;; Step 3: try to answer as many of these questions as possible before we start
;; writing our code, from looking at our examples.

;; What do we need to know to write a recursive function over lists?
;;
;; 1. name of the function
; list-length   <- from the examples!
;; 2. how many arguments does the function take
; 1 argument    <- from the examples!
;; 3. the types of the arguments the function takes
; a list of any length, containing values of any type  <- from the examples!
;; 4. we need to know the value of the base case of the recursion
; 0 <- from the examples!
;; 5. we need to know which argument(s) to recur on
; only have one argument--recur on that!  <- from the examples!
;; 6. we need to know how to combine the results from the recursion(s)

;; Step 4: start filling out the skeleton for a recursive function definition,
;; and use the "Wishful Thinking" approach to defining the recursive clauses.

(define list-length
  (lambda (ls) ;; what happens when ls is (a b c d e)
    (cond
      ((null? ls) 0)                 ;; base-case clause
      (else
       ;; Steps in Wishful Thinking:
       ;; Call a "library function" that we assume is correct
       ;; (wills-list-length (cdr ls))       ;; 1. orginal version produces 4, not 5
       ;; (+ (wills-list-length (cdr ls)) 1) ;; 2. adjust the result of the call to produces 5
       (+ (list-length (cdr ls)) 1)          ;; 3. rename 'wills-list-length' to be 'list-;ength'
       )  ;; recursive-case clause
      ;; cdr of ls is (b c d e), so
      ;; (wills-list-length (cdr ls))
      ;; would return 4
      ;; so, add 1 to the result of the recursion!
      ;;
      ;; Then, change the call from 'wills-list-length' to 'list-length'!
      )))

(list-length '()) ;; => 0
(list-length '(a b c d e)) ;; => 5     less simple example
(list-length '(#t #f)) ;; => 2
(list-length '(1 2 3)) ;; => 3

#| ;; skeleton
(define <function-name>
  (lambda (<argument 1> <argument 2> ... <argument n>)
    (cond
      (<base-case test1> <base-case value1>) ;; base-case cond clause
      (<base-case test2> <base-case value2>)
      ...
      (<recursive-case test1> <recursive-case value1>) 
      (<recursive-case test2> <recursive-case value2>)
      ...
      (else <recursive-case valueN>))))
|#




(define filter-evens
  (lambda (lon) ;; list of numbers     lon is (6 1 4) => (6 4)
    (cond
      ((null? lon) '()) ; base case
      ;; (wills-filter-evens '(1 4)) => (4)
      ((even? (car lon)) (cons (car lon) (filter-evens (cdr lon)))) ;; recursive case 1
      (else (filter-evens (cdr lon))) ;; recursive case 2
      )))

(filter-evens '()) ; => ()
(filter-evens '(3 6 1 4)) ; => (6 4)
(filter-evens '(5 8 9 0 1 2 3 8 20 17 42 6)) ;; => (8 0 2 8 20 42 6)
