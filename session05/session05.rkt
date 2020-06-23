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


;; factorial
;;
;; 0! = 1   base case
;; 1! = 1 * 1
;; 2! = 2 * 1 * 1 = 2
;; 3! = 3 * 2 * 1 * 1 = 6
;; 5! = 5 * 4 * 3 * 2 * 1 * 1 = 120

;; n! = n * n-1 * n-2 ... * 1
;; 4! = 4 * 3 * 2 * 1 = 24

(define !
  (lambda (n)
    (cond
      ((zero? n) 1)
      (else (* n (! (sub1 n)))))))

(! 0)
(! 1)
(! 5)


;; (take 0 '(a b c d e f)) => '()
;; (take 3 '()) => '()
;; (take 3 '(a b c d e f)) => '(a b c)

(define take
  (lambda (n ls)
    (cond
      ((zero? n) '())
      ((null? ls) '())
      (else (cons (car ls)
                  (take (- n 1) (cdr ls)))))))

(take 0 '(a b c d e f)) ;; => '()
(take 3 '()) ;; => '()
(take 3 '(a b c d e f)) ;; => '(a b c)



;; (even? 0) => #t
;; (even? 1) => #f
;; (even? 5) => #f
;; (even? 6) => #t

;; (odd? 0) => #f
;; (odd? 1) => #t
;; (odd? 5) => #t
;; (odd? 6) => #f

;; mutual recursion

(define even?
  (lambda (n)
    (cond
      ((zero? n) #t)
      (else (odd? (sub1 n))))))

(define odd?
  (lambda (n)
    (cond
      ((zero? n) #f)
      (else (even? (sub1 n))))))


;; direct-style version of factorial
;; (non-tail-recursive definition)
#|
(define !
  (lambda (n)
    (cond
      ((zero? n) 1)
      (else (* n (! (sub1 n)))))))
|#

(! 5) ;; =>
(* 5 (* 4 (* 3 (* 2 (* 1 1)))))


;; accumulator-passing-style version of factorial
;; (tail-recursive definition)
(define !-aps
  (lambda (n a) ;; 'a' is the "accumulator" argument
    (cond
      ((zero? n) a)
      (else (!-aps (sub1 n) (* n a))))))

(!-aps 0 1) ;; => 1
(!-aps 1 1) ;; => 1

(!-aps 5 1) ;; =>
(!-aps 4 5) ;; =>
(!-aps 3 20) ;; =>
(!-aps 2 60) ;; =>
(!-aps 1 120) ;; =>
(!-aps 0 120) ;; => 120

;; higher-order function
(define map
  (lambda (f ls)
    (cond
      ((null? ls) '())
      (else (cons (f (car ls))
              (map f (cdr ls)))))))

(map add1 '(7 3 2 4 2 9)) ;; => (8 4 3 5 3 10)
(map even? '(7 3 2 4 2 9))
(map (lambda (n) (* n n)) '(7 3 2 4 2 9))
(map (lambda (fruit) (cons fruit '(is yummy)))
     '(apple cherry blueberry))

(map add1 '()) ;; => '()



(define count-fives
  (lambda (ls)
    (cond
      ((null? ls) 0)
      ((= (car ls) 5) (add1 (count-fives (cdr ls))))
      (else (count-fives (cdr ls))))))

(count-fives '()) ;; => 0
(count-fives '(3 6 8 8 42 9 1)) ;; => 0
(count-fives '(3 6 8 8 42 5 9 5 1 5)) ;; => 3
(count-fives '(5 3 6 8 8 42 5 9 5 1 5)) ;; => 4

(define tree-count-fives
  (lambda (ls)
    (cond
      ((null? ls) 0)
      ;; this is the magic!
      ((pair? (car ls))
       (+ (tree-count-fives (car ls))
          (tree-count-fives (cdr ls))))
      ((= (car ls) 5) (add1 (tree-count-fives (cdr ls))))
      (else (tree-count-fives (cdr ls))))))

(tree-count-fives '()) ;; => 0
(tree-count-fives '(3 6 (8 8) ((((42)) 9)) 1)) ;; => 0
(tree-count-fives '(3 6 8 8 42 5 9 5 1 5)) ;; => 3
(tree-count-fives '(5 3 6 8 8 42 5 9 5 1 5)) ;; => 4
(tree-count-fives '(((5)) ((2 (14 (5 (3 6 8))) 5)) 8 42 (((5))) 9 5 1 5)) ;; => 6
