#lang racket

;; Export all the definitions in this file
(provide (all-defined-out))

;; Turn off annoying printing of quote marks
(print-as-expression #f)

;; Namespace magic to make 'eval' work properly in the file (as opposed to in the REPL)
;;
;; https://stackoverflow.com/questions/20778926/mysterious-racket-error-define-unbound-identifier-also-no-app-syntax-trans
(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))
;;
;; To evaluate the list (+ 3 4) as an expression, we would write:
;;
;; (eval '(+ 3 4) ns)
;; =>
;; 7


















;; Let's write a Scheme interpreter in Scheme!
;;
;; interpreter = evaluator

;; (eval-expr '((lambda (x) x) (+ 3 4))) ;; => 7

;; represent environment as an association list
;; initial environment   ()
(let ((a 137))
  ;; ((a . 137))
  (+ a
     (let ((b 42))
       ;; ((b . 42) (a . 137))
       (let ((a 10))
         ;; ((a . 10) (b . 42) (a . 137))
         (+ a b)))))

;; equivalent to the let expressions above:
;; initial environment ()
((lambda (a)
   ;; ((a . 137))
   (+ a
      ((lambda (b)
         ;; ((b . 42) (a . 137))
         ((lambda (a)
            ;; ((a . 10) (b . 42) (a . 137))
            (+ a b))
          10))
       42)))
 137)


;; Meta-circular Scheme interpreter
(define eval-expr
  (lambda (expr env)
    (match expr
      [(? number? n) ;; pattern, with a guard
       n ;; value
       ] ;; match clause
      [(? boolean? b)
       b]
      [`(+ ,e1 ,e2) ;; Small Scheme addition
       ;; we use Racket's built-in addition:
       (+ (eval-expr e1 env) (eval-expr e2 env))]
      [`(* ,e1 ,e2)
       (* (eval-expr e1 env) (eval-expr e2 env))]
      [`(- ,e1 ,e2)
       (- (eval-expr e1 env) (eval-expr e2 env))]
      [`(if ,e1 ,e2 ,e3)
       (let ((b (eval-expr e1 env)))
         (unless (boolean? b)
           (error 'eval-expr
                  (format "argument to if must evaluate to a Boolean constant")))
         (if b
             (eval-expr e2 env)
             (eval-expr e3 env)))]

      ;; call-by-value lambda-calculus
      [(? symbol? x) ;; variable
       (lookup x env)]
      [`(lambda (,x) ,e) ;; lambda (abstraction)
       `(proc ,x ,e ,env) ;; procedure ("closure", since it closes over the environment)
       ]
      [`(,e1 ,e2) ;; application
       (let ((v (eval-expr e2 env)))
         (match (eval-expr e1 env)
           [`(proc ,x ,e ,env^)
            (eval-expr e `((,x . ,v) . ,env^))
            ;; equivalent to:
            ;; (eval-expr e (cons (cons x v) env^))
            ]
           [else (error 'eval-expr "expected a procedure for application")]))
       ]
      )))

#|
;; core interpreter -- call-by-value lambda-calculus
(define eval-expr
  (lambda (expr env)
    (match expr
      [(? symbol? x) (lookup x env)]
      [`(lambda (,x) ,e) `(proc ,x ,e ,env)]
      [`(,e1 ,e2)
       (let ((v (eval-expr e2 env)))
         (match (eval-expr e1 env)
           [`(proc ,x ,e ,env^)
            (eval-expr e `((,x . ,v) . ,env^))]))])))
|#


(define lookup
  (lambda (x env)
    (match env
      ['()
       (error 'lookup
              (format "attempt to reference unbound variable ~s" x))]
      [`((,y . ,val) . ,rest)
       (if (equal? y x)
           val
           (lookup x rest))])))

#|
;; alternative definition of lookup, using cond instead of match:
(define lookup
  (lambda (x env)
    (cond
      ((null? env)
       (error 'lookup
              (format "attempt to reference unbound variable ~s" x)))
      ((equal? (caar env) x) (cdar env))
      (else (lookup x (cdr env))))))
|#

(eval-expr '((lambda (z) (+ z z)) (* 2 3)) '()) ;; => 12
(eval-expr '((lambda (z) (+ w z)) (* 2 3)) '((w . 5))) ;; => 11

(eval-expr '(;; e1 => (proc z (+ w z) ((w . 5)))
             ;; (eval-expr (+ w z) ((z . 6) (w . 5)))
             (lambda (z)
               (+ w z))
             (* 2 3) ;; e2 => 6
             )
           '((w . 5))) ;; => 11

;; (eval-expr '((lambda (z) (+ w z)) (* 2 3)) '()) ;; => error

(let ((w 5))
  ;; w = 5
  (lambda (z) (+ w z)))

(eval-expr '(lambda (z) (+ z z)) '()) ;; => (proc z (+ z z) ())
(eval-expr '(lambda (z) (+ w z)) '((w . 5))) ;; => (proc z (+ w z) ((w . 5)))

(let ((y (* 21 2)))
  ;; y = 42
  (let ((x (+ 9 3)))
    ;; x = 12, y = 42
    (+
     (let ((y (+ 5 5)))
       ;; y = 10, x = 12
       (* x y) ;; 120
       )
     ;; x = 12, y = 42
     y)
    ;; x = 12, y = 42
    )
  ;; y = 42
  )

;; association list
(cons (cons 'y 10) (cons (cons 'x 12) (cons (cons 'y 42) '())))

(lookup 'y '((y . 10) (x . 12) (y . 42))) ;; => 10

;; eval-expr's second argument is an *environment*
;; mapping variables to values
;; (eval-expr 'y '()) ;; error
(eval-expr 'y '((y . 42))) ;; => 42
(eval-expr 'y '((x . 12) (y . 42))) ;; => 42
(eval-expr 'y '((y . 10) (x . 12) (y . 42))) ;; => 10

#|
(eval-expr 'y) ;; variable reference case
(eval-expr '(lambda (z) (+ z z))) ;; lambda case
(eval-expr '(
             (lambda (z) (+ z z)) ;; e1
             (* 3 4) ;; e2
             )
           ) ;; application case

(eval-expr '5)
(eval-expr '#t)
(eval-expr '#f)
(eval-expr '(+ 3 4))
(eval-expr '(* 3 4))
(eval-expr '(- 3 4))
(equal?
 (eval-expr '(+ (+ 3 5) (+ 6 7)))
 21)
(equal?
 (eval-expr '(* (* 3 5) (+ 6 7)))
 195)
(equal?
 (eval-expr '(- (* 3 5) (+ 6 7)))
 2)

(equal?
 (eval-expr '(if #t 3 4))
 3)
(equal?
 (eval-expr '(if #f 3 4))
 4)
(equal?
 (eval-expr '(if (if #t #f #t)
                 3
                 4))
 4)
(equal?
 (eval-expr '(if (if #t #f #t)
                 (+ 3 4)
                 (* 3 4)))
 12)

;; This test signals an error if we restrict
;; the test expression to evaluate to a Boolean
;; constant
#|
(equal?
 (eval-expr '(if 5
                 6
                 7))
 6)
|#
|#
