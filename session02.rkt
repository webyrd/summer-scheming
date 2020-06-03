#lang racket

;; namespace magic to make 'eval' work properly in the file (as opposed to in the REPL)
;;
;; https://stackoverflow.com/questions/20778926/mysterious-racket-error-define-unbound-identifier-also-no-app-syntax-trans
(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))

;; Scheme is homoiconic

(list 3 4 5)

(list 'list 3 4 5) ;; expression we're evaluating
;; =>
(list 3 4 5) ;; the value of that expression

;; meta-programming: writing programs that manipulate programs

(expt 3 4)

(cons 'expt (cons 3 (cons 4 '())))
;; =>
(expt 3 4)

'(expt 3 4)
;; =>
(expt 3 4)

(eval '(expt 3 4) ns)
;; =>
81


;; Lists (the 4 main concepts), Racket version

;; 1. empty list ()

'()  ;; *** evaluates to the empty list

(list) ;; as an aside, this expression also evaluates to the empty list, although we normally use '()

;; 2. cons (list constructor)

(cons #f (cons 7 '()))

;; 3. first (returns the first element in a list)

(first '(1 2 3))
;; =>
1

;; first of the empty list produces and error
; (first '())

;; 4. rest (returns the rest of the list)

(rest '(1 2 3))
;; =>
;; (2 3)



;; Lists (the 4 main concepts), Scheme version



;; 1. empty list ()

'()  ;; *** evaluates to the empty list

(list) ;; as an aside, this expression also evaluates to the empty list, although we normally use '()

;; 2. cons (list constructor)

(cons #f (cons 7 '()))

;; 3. car (returns the first element in a list)

(car '(1 2 3))
;; =>
1

;; car of the empty list produces and error
; (car '())

;; 4. cdr (returns the rest of the list)

(cdr '(1 2 3))
;; =>
;; (2 3)


(cdr '(1 2 3))
;; =>
; (2 3)

(car (cdr '(1 2 3)))
;; =>
2


;; can chain the names 'car' and 'cdr'
(cadr '(1 2 3))
;; =>
2

cadadr


;; Big reveal!
;;
;; 'cons' constructs pairs, not lists!
;;
;; lists are special types of pair structures (or the empty list)

(cons 3 4)
;; =>
;; (3 . 4)

(cons 1 (cons 2 (cons 3 (cons 4 '()))))
;; =>
;; (1 2 3 4)

(cons 1 (cons 2 (cons 3 (cons 4 5))))
;; =>
;; (1 2 3 4 . 5)

'(1 . (2 . (3 . (4 . ()))))
;; =>
;; (1 2 3 4)

;; What is a list???
;;
;; Inductive definition:
;;
;; A list is either:
;; 1. the empty list [base case]
;; 2. or, a cons pair whose cdr (or rest) is a list [inductive case]

'() ;; is a list

(cons 3 '()) ;; is a list

(cons 3 (cons 4 '()))

(list? '())
;; =>
#t

(list? (cons 3 (cons 4 '())))
;; =>
#t

(list? 5)
;; =>
#f

(list? (cons 3 4))


(pair? (cons 3 4))
;; =>
#t

(pair? '())
;; =>
#f

;; The real story:

;; cons constructs pairs.  some pairs are lists, but not all

