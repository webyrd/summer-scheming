#lang racket

(cons #t #f)

; (define z f)
; (define f (cons d e))
; (define e (cons c '()))
; (define c (cons '() 3))
; (define b (cons 7 8))
; (define d (cons a b))
; (define a (cons 5 6))

(define z (cons (cons (cons 5 6) (cons 7 8)) (cons (cons '() 3) '())))


'(((5 . 6) . (7 . 8)) . ((() . 3) . ()))

'(((5 . 6) 7 . 8) (() . 3))





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
      ((equal? x '()) #t)
      ((pair? x) (prettier-proper-list? (cdr x)))
      (else #f))))

(define prettiest-proper-list?
  (lambda (x)
    (cond
      ((null? x) #t)
      ((pair? x) (prettiest-proper-list? (cdr x)))
      (else #f))))

;; MIT syntax (like in SICP)
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