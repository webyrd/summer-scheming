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

;; core interpreter -- call-by-value lambda-calculus

;; representation of environments and closures/procedures:
;; * data-structural/first-order representation
;;   ** tagged-list representation
;;   ** association list
;;   ** etc.
;; * higher-order/procedural representation

;; first-order/data-structural (association list) representation of environments
;; first-order/data-structural (tagged list) representation of closures (procedures)
#|
(define eval-expr
  (lambda (expr env)
    (match expr
      [(? symbol? x) (lookup x env)]
      [`(lambda (,x) ,e) `(closure ,x ,e ,env)]
      [`(,e1 ,e2)
       (let ((v (eval-expr e2 env)))
         (match (eval-expr e1 env)
           [`(closure ,x ,e ,env^)
            (eval-expr e `((,x . ,v) . ,env^))]))])))

(define lookup
  (lambda (x env)
    (match env
      ['() (error 'lookup (format "attempt to reference unbound variable ~s" x))]
      [`((,y . ,val) . ,rest) (if (equal? y x) val (lookup x rest))])))
|#

#|
association list    key/value mapping
()
((k1 . v1) (k2 . v2) ...)

()
((a . 6))
((b . #t) (a . 6))
((a . 5) (b . #t) (a . 6))


tagged list representation of environments:

'empty-env
`(extend-env ,x ,v ,old-env)

empty-env
(extend-env a 6 empty-env)
(extend-env b #t (extend-env a 6 empty-env))
(extend-env a 5 (extend-env b #t (extend-env a 6 empty-env)))
|#

;; first-order/data-structural (tagged list) representation of environments
;; first-order/data-structural (tagged list) representation of closures (procedures)
#|
(define eval-expr
  (lambda (expr env)
    (match expr
      [(? symbol? x) (lookup x env)]
      [`(lambda (,x) ,e) `(closure ,x ,e ,env)]
      [`(,e1 ,e2)
       (let ((v (eval-expr e2 env)))
         (match (eval-expr e1 env)
           [`(closure ,x ,e ,env^)
            (eval-expr e `(extend-env ,x ,v ,env^))]))])))

(define lookup
  (lambda (x env)
    (match env
      ['empty-env
       (error 'lookup (format "attempt to reference unbound variable ~s" x))]
      [`(extend-env ,y ,val ,rest) (if (equal? y x) val (lookup x rest))])))

(eval-expr 'w '(extend-env w 5 empty-env))
;;(eval-expr '5 'empty-env)
(eval-expr '((lambda (x) x) (lambda (y) y)) 'empty-env)
|#

;; first-order/data-structural (tagged list) representation of environments
;; higher-order/procedural representation of closures (procedures)
#|
(define eval-expr
  (lambda (expr env)
    (match expr
      [(? symbol? x) (lookup x env)]
      [`(lambda (,x) ,e)
       (lambda (v) (eval-expr e `(extend-env ,x ,v ,env)))]
      [`(,e1 ,e2) ((eval-expr e1 env) (eval-expr e2 env))])))

(define lookup
  (lambda (x env)
    (match env
      ['empty-env
       (error 'lookup (format "attempt to reference unbound variable ~s" x))]
      [`(extend-env ,y ,val ,rest) (if (equal? y x) val (lookup x rest))])))

(eval-expr 'w '(extend-env w 5 empty-env))
(eval-expr '((lambda (x) x) (lambda (y) y)) 'empty-env)
(eval-expr '((lambda (x) x) w) '(extend-env w 5 empty-env))
|#

;; higher-order/procedural representation of environments
;; higher-order/procedural representation of closures (procedures)
#|
(define eval-expr
  (lambda (expr env)
    (match expr
      [(? symbol? x)
       (env x)]
      [`(lambda (,x) ,e)
       (lambda (v)
         (eval-expr e (lambda (y)
                        (if (equal? y x)
                            v
                            (env y)))))]
      [`(,e1 ,e2)
       ((eval-expr e1 env) (eval-expr e2 env))])))

(eval-expr '((lambda (x) x) (lambda (y) y))
           (lambda (y) (error 'lookup (format "attempt to reference unbound variable ~s" y))))



(eval-expr 'w
           (lambda (y)
             (if (equal? y 'w)
                 5
                 ((lambda (y) (error 'lookup (format "attempt to reference unbound variable ~s" y))) y))))

(eval-expr '((lambda (x) x) w)
           (lambda (y)
             (if (equal? y 'w)
                 5
                 ((lambda (y) (error 'lookup (format "attempt to reference unbound variable ~s" y))) y))))
|#



;; representation-independent with-respect-to environments


;; environment helper functions

#|
;; procedural/higher-order representation of environments:
(define make-empty-env
  (lambda ()
    (lambda (y)
      (error 'lookup (format "attempt to reference unbound variable ~s" y)))))

(define extend-env
  (lambda (x v env)
    (lambda (y)
      (if (equal? y x)
          v
          (env y)))))

(define apply-env
  (lambda (env x)
    (env x)))
|#

;; association-list representation of environments
(define make-empty-env
  (lambda ()
    '()))

(define extend-env
  (lambda (x v env)
    `((,x . ,v) . ,env)))

(define apply-env
  (lambda (env x)
    (match env
      ['() (error 'apply-env (format "attempt to reference unbound variable ~s" x))]
      [`((,y . ,val) . ,rest) (if (equal? y x) val (apply-env rest x))])))


#|
(define eval-expr
  (lambda (expr env)
    (match expr
      [(? symbol? x) (apply-env env x)]
      [`(lambda (,x) ,e)
       (lambda (v)
         (eval-expr e (extend-env x v env)))]
      [`(,e1 ,e2)
       ((eval-expr e1 env) (eval-expr e2 env))])))

(eval-expr 'w (extend-env 'w 5 (make-empty-env)))
(eval-expr '((lambda (x) x) (lambda (y) y)) (make-empty-env))
(eval-expr '((lambda (x) x) w) (extend-env 'w 5 (make-empty-env)))
|#


;; helper functions for procedures

;; higher-order/procedural representation of procedures
#|
(define apply-proc
  (lambda (proc v)
    (proc v)))

(define make-proc
  (lambda (x e env)
    (lambda (v)
      (eval-expr e (extend-env x v env)))))
|#

;; data-structural/first-order (tagged list) representation of procedures
(define apply-proc
  (lambda (proc v)
    (match proc
      [`(closure ,x ,e ,env^)
       (eval-expr e (extend-env x v env^))])))

(define make-proc
  (lambda (x e env)
    `(closure ,x ,e ,env)))




;; representation-indepedent with respect to both environments and procedures:
(define eval-expr
  (lambda (expr env)
    (match expr
      [(? symbol? x) (apply-env env x)]
      [`(lambda (,x) ,e) (make-proc x e env)]
      [`(,e1 ,e2) (apply-proc (eval-expr e1 env) (eval-expr e2 env))])))

(eval-expr 'w (extend-env 'w 5 (make-empty-env)))
(eval-expr '((lambda (x) x) (lambda (y) y)) (make-empty-env))
(eval-expr '((lambda (x) x) w) (extend-env 'w 5 (make-empty-env)))
