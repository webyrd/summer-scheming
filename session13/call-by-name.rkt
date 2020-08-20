#lang racket

;; Export all the definitions in this file
(provide (all-defined-out))

;; Turn off annoying printing of quote marks
(print-as-expression #f)


;; call-by-name
(define eval-expr
  (lambda (expr env)
    (match expr
      [(? number? n) n]
      [`(+ ,e1 ,e2)
       (+ (eval-expr e1 env) (eval-expr e2 env))]
      [(? symbol? x)
       (let ((l (lookup x env)))
         (match l
           [`(,e ,env^)
            (eval-expr e env^)]))]
      [`(lambda (,x) ,e) `(closure ,x ,e ,env)]
      [`(,e1 ,e2)
       (match (eval-expr e1 env)
         [`(closure ,x ,e ,env^)
          (eval-expr e `(extend-env ,x (,e2 ,env) ,env^))])])))

(define lookup
  (lambda (x env)
    (match env
      ['empty-env
       (error 'lookup (format "attempt to reference unbound variable ~s" x))]
      [`(extend-env ,y ,val ,rest) (if (equal? y x) val (lookup x rest))])))

(printf "call-by-name: f applied to omega:\n")
(eval-expr '((lambda (f)
               (f ((lambda (x) (x x)) (lambda (x) (x x)))))
             (lambda (x) (+ 5 6)))
           'empty-env)
(printf "done!\n")

(printf "call-by-name: f applied to omega, using x:\n")
(eval-expr '((lambda (f)
               (f ((lambda (x) (x x)) (lambda (x) (x x)))))
             (lambda (x) (+ x 6)))
           'empty-env)
(printf "done!\n")

