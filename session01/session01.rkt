#lang racket

5

(+)
(+ 3)
(+ 3 4)
(+ 3 4 5 6 6 7 2 4 12)

(*)
(* 3)
(* 3 4)

(expt 2 1000)

(+ 3 (* 4 5)) ;; expression
;; => 23 value

(define x 5)
(define y (+ 3 4))

x
(display x) ;; prints out a value

;; Scheme-style if expression
(if (zero? x)
    (+ x 4)
    (- x 4))

; // Java-style if statement
; if (x > 3) {
;   y = y + x;
; } else {
;   System.out.println("hello");
; }

; (x > 3) ? (x + 4) : (x - 4)



(zero? x)

#t

#f

(if #t ;; test
    3  ;; then-part
    4  ;; else-part
    )

(if #f
    3
    4)

(list 3 4 5)

(list )

(list 3 (list 4 5) 6)

'() ;; empty list

(cons 3 '())

(cons 3 (cons 4 '()))

(cons 5 (cons 6 (cons 7 '())))

(cons (cons 5 '()) (cons 6 (cons 7 '())))

(cons #t (cons 5 '()))

(cons "hello" (cons #t (cons 5 '())))

(cons 'knight (cons 'king (cons 'queen (cons 'bishop (cons 'pawn '())))))

(+ 3 4)

(cons + (cons * '()))

(cons '+ (cons '* '()))

(first (cons '+ (cons '* '())))

(cons '+ (cons 3 (cons 4 '())))

(cons '+ (cons 3 (cons 4 '())))

(cons 'expt (rest (cons '+ (cons 3 (cons 4 '())))))

(cons 'expt (rest '(+ 3 4)))

(cons '- (rest '(+ 3 4)))

(eval (cons '- (rest '(+ 3 4))))