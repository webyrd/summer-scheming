#lang racket

(provide (all-defined-out))

;; Turn off annoying printing of quote marks
(print-as-expression #f) 

;; namespace magic to make 'eval' work properly in the file (as opposed to in the REPL)
;;
;; https://stackoverflow.com/questions/20778926/mysterious-racket-error-define-unbound-identifier-also-no-app-syntax-trans
(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))


;; Theme: meta-programming      interpreters, compilers, parsers, etc.

;; quasiquotation practice

;; syntax of an 'if' expression:
;; (if <test> <consequent> <alternative>)
;;
;; (if (null? l) '() (cdr l))
;; (if (zero? n) 1 (* n 2))

(let ((test (quote (null? l)))
      (consequent (quote '()))
      (alternative (quote (cdr l))))
  (list 'if test consequent alternative))

(let ((test (quote (null? l)))
      (consequent (quote '()))
      (alternative (quote (cdr l))))
  (cons 'if
        (cons test
              (cons consequent
                    (cons alternative '())))))

(let ((test (quote (null? l)))
      (consequent (quote '()))
      (alternative (quote (cdr l))))
  `(if ,test ,consequent ,alternative))

;; pattern-matching

(define my-if '(if (zero? n) 1 (* n 2)))

(match my-if
  ;;(if (zero? n) 1 (* n 2)))
  (`(if ,e1 ,e2 ,e3) ;; pattern
    e1 ;; value
   ))


;; Scheme simplifier

(let ((x (+ 3 4)))
  (* x x))
;; equivalent to:
((lambda (x) (* x x))
 (+ 3 4))

#|
(let ((<id> <e>)) <body>)
equivalent to:
((lambda (<id) <body) <e>)
|#

#|
(cond
  (<test1> <value1>)
  (else <valueN>))
equivalent to:
(if <test1>
    <value1>
    <valueN>)
|#

#|
(cond
  ((null? l) '())
  ((zero? n) 1)
  (else (* n n)))
equivalent to:
(if (null? l)
    '()
    (if (zero? n)
        1
        (if #t
            (* n n)
            'whatever)))
equivalent to:
(if (null? l)
    '()
    (if (zero? n)
        1
        (* n n)))
|#


;; grammar for Small Scheme:
#|
expr ::= <id> |
         <number> |
         #t |
         #f |
         (quote <datum>) |
         (if <expr> <expr> <expr>) |
         (let ((<id> <expr>)) <expr>) |
         (cond (<expr> <expr>) ... (else <expr>)) |
         (lambda (<id>) <expr>) |
         (<expr> <expr>)
|#

(let ((f (lambda (n) (if (zero? n) #f #t))))
  (cond
    ((f 0) 3)
    ((f 1) 5)
    (else 4)))

#| grammar for Simplified Small Scheme
expr ::= <id> |
         <number> |
         #t |
         #f |
         (quote <datum>) |
         (if <expr> <expr> <expr>) |
         (lambda (<id>) <expr>) |
         (<expr> <expr>)
|#

((lambda (f)
   (if (f 0)
       3
       (if (f 1)
           5
           4)))
 (lambda (n) (if (zero? n) #f #t)))

;; Source-to-source program transformation
(define simplify
  (lambda (expr)
    ;; (printf "simplify  expr: ~s\n" expr)
    (match expr
      [(? symbol? x) x] ;; variable case
      [(? number? n) n]
      [(? boolean? b) b]
      [`(quote ,datum) `(quote ,datum)]
      [`(if ,e1 ,e2 ,e3)
       `(if ,(simplify e1) ,(simplify e2) ,(simplify e3))]
      [`(let ((,x ,e)) ,body)
       `((lambda (,x) ,(simplify body)) ,(simplify e))]
      [`(cond . ,c*)
       (simplify-cond c*)]
      [`(lambda (,x) ,e) ;; lambda case
       `(lambda (,x) ,(simplify e))]
      [`(,e1 ,e2) ;; procedure application case
       `(,(simplify e1) ,(simplify e2))])))

(define simplify-cond
  (lambda (c*)
    ;; (printf "simplify-cond  c*: ~s\n" c*)
    (match c*
      [`((else ,e)) (simplify e)]
      [`((,te ,ve) . ,rest-c)
       `(if ,(simplify te)
            ,(simplify ve)
            ,(simplify-cond rest-c))])))

(simplify '(if (null? l) 3 4))

(simplify '(let ((x (square 3)))
             (double x)))

(simplify '(let ((f (lambda (n)
                      (if (zero? n)
                          #f
                          #t))))
             (cond
               ((f 0) 3)
               ((f 1) 5)
               (else 4))))

;; Test the simplifier by
;; checking that the values of original
;; expression and the simplified expression
;; are the same, when passing those expressions
;; to 'eval'
;;
;; We need to pass the namespace 'ns' to 'eval' to make Racket happy.
(let ((expr '(let ((f (lambda (n)
                        (if (zero? n)
                            #f
                            #t))))
               (cond
                 ((f 0) 3)
                 ((f 1) 5)
                 (else 4)))))
  (equal? (eval expr ns) (eval (simplify expr) ns)))



(simplify '(let ((f (lambda (n)
                      (if (zero? n)
                          #f
                          #t))))
             1))

(simplify '(cond
             ((f 0) 3)
             ((f 1) 5)
             (else 4)))

(simplify '(cond
             (6 3)
             (7 5)
             (else 4)))

(simplify '(cond
             (6 3)
             (else 4)))

(simplify '(cond
             (else 4)))
