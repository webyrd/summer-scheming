#lang racket

;; recursion on lists

;; A proper list is either:
;; 1. the empty list   '()
;; 2. or a cons pair whose cdr is a proper list.

;; examples of expressions that evaluate to proper lists:
'()
(cons 3 '())
(cons 3 (cons 4 '()))
(cons (cons 3 4) '())

;; examples of expressions that evaluate to values that are *not* proper lists:
5
(cons 3 4)
#t
(cons '() 3)




(define mult3
  (lambda (l)
    (cond
      ((null? l) '())
      ((pair? (car l)) ;; deep recursion
        (cons (mult3 (car l))
              (mult3 (cdr l))))
      (else (cons (* (car l) 3) (mult3 (cdr l)))))))

(mult3 '()) ;; => ()
(mult3 '(7)) ;; => (21)
(mult3 '(3 5 1 7 9)) ;; => (9 15 3 21 27)
(mult3 '(3 (5 ((1))) (7) (((9))))) ;; => (9 (15 ((3))) (21) (((27))))





(define sum
  (lambda (l)
    (cond
      ((null? l) 0)
      ((pair? (car l))
       (+ (sum (car l))
          (sum (cdr l))))
      (else (+ (car l) (sum (cdr l)))))))

(sum '()) ;; => 0
(sum '(5)) ;; => 5
(sum '(8 1 2 3 7)) ;; => 21
(sum '((8) 1 (((2 (3))) 7))) ;; => 21


(map (lambda (n) (+ n 1)) '(1 2 3 4 5))
;; => (2 3 4 5 6)
;; (map sum '(1 2 3 4 5))  ;; why doesn't this work??

(map sum '((3 4 6) (8 7))) ;; => (13 15)

(define filter
  (lambda (f ls)
    (cond
      ((null? ls) '())
      ((f (car ls)) (cons (car ls) (filter f (cdr ls))))
      (else (filter f (cdr ls))))))


(filter even? '()) ;; => ()
(filter even? '(4 7 3 2 9 7)) ;; => (4 2)
(filter odd? '(4 7 3 2 9 7))  ;; => (7 3 9 7)
(filter (lambda (n) (> n 3)) '(4 7 3 2 9 7)) ;; => (4 7 9 7)
(filter symbol? '(5 #t cat 7 #f dog)) ;; => (cat dog)

(filter (lambda (n) (+ n 1)) '(4 7 3 2 9 7)) ;; => (4 7 3 2 9 7)
;; because any number (or any other value that isn't #f) is a true value in Scheme!

;; (filter sum '(4 7 3 2 9 7))  ;; why doesn't this work??


(define append
  (lambda (l1 l2)
    (cond
      ((null? l1) l2)
      (else (cons (car l1) (append (cdr l1) l2))))))

(append '() '()) ;; => ()
(append '(a) '()) ;; => (a)
(append '() '(b)) ;; => (b)
(append '() '(cat dog mouse)) ;; => (cat dog mouse)

(append '(a b c) '(d e)) ;; => (a b c d e)





;;; Environments, variables, binding, lexical scope



(lambda (x) (+ x x)) ;; => procedure (function)

((lambda (x) (+ x x)) 5) ;; => 10
;; defined in Scheme/Racket to be identical!
(let ((x 5))
  (+ x x)) ;; => 10

(let ((x 5)) ;; let binding: x is bound to 5 in the body of the outer let expression
  (let ((y 6)) ;; let binding: y is bound to 6 in the body of the inner let expression
    (+ x y)))

(define x 10) ;; top-level definition of x:  x is bound to 10
(* x x) ;; => 100

(let ((x 6)) ;; shadow x:  x is bound to 6 in the body of the let expression
  (* x x)  ;; => 36
  )

(* x x) ;; => 100

;; here x is 10
(let ((x (+ 2 3))) ;; (+ 2 3) evaluates to 5; x is shadowed, and bound to 5 in the body of outer let
  ;; here x is 5
  (let ((x (+ x 7))) ;; x is shadowed again, and bound to (+ x 7) = 12 in the body of the inner let
    ;; here x is 12
    (* x x) ;; => 144
    ;; here x is 12
    )
  ;; here x is 5
  )
;; here x is 10


;; something equivalent, using different variable names:

;; here x is 10
(let ((x1 (+ 2 3))) ;; (+ 2 3) evaluates to 5; x is shadowed, and bound to 5 in the body of outer let
  ;; here x1 is 5
  (let ((x2 (+ x1 7))) ;; x is shadowed again, and bound to (+ x 7) = 12 in the body of the inner let
    ;; here x2 is 12
    (* x2 x2) ;; => 144
    ;; here x2 is 12
    )
  ;; here x1 is 5
  )
;; here x is 10

;; environment: contains information about the bindings of variables to their values

;; environment: x -> 10
(let ((a 5))
  ;; environment: a -> 5; x -> 10
  (let ((b 6))
    ;; environment: b -> 6; a -> 5; x -> 10
    (displayln b) ;; 6
    (let ((c 7))
      ;; environment: c -> 7; b -> 6; a -> 5; x -> 10
      (let ((b 8)) ;; shadowing b:  b is bound to the value 8 within the scope of the innermost let
        ;; environment: b -> 8; c -> 7; a -> 5; x -> 10
        (displayln b) ;; 8
        (+ a b c x))
      ;; environment: c -> 7; b -> 6; a -> 5; x -> 10
      (displayln b) ;; 6
      )
    )
  )



