#lang racket

;; Goal: write a meta-circular interpreter in Scheme/Racket
;;
;; meta-circular interpreter: an interpreter for a programming language that is
;; written in the language we want to interpret. For example, a Scheme interpreter
;; written in Scheme.

;; What do we need to know:
;;
;; * lists and pairs, cons, car, cdr, null?
;; * symbols and quotation
;; * recursion
;; * lambda expressions
;; * procedure application
;; * variables
;; * scope and binding and shadowing of variables
;; * [optional, but very convenient] pattern matching and quasiquotation and unquotation


;; Quotation and quasiquotation

;; quote: '
;; quasiquote (or "backquote"):  `
;; unquote: ,
;; unquote-splicing: ,@

;; quote
'cat ;; => cat    The expression 'cat evaluates to the symbol cat
(symbol? 'cat) ;; => #t

;; Symbols and strings are different!
"Socks the Cat" ;; => "Socks the Cat"
(string? "Socks the Cat") ;; => #t
(symbol? "Socks the Cat") ;; => #f

;; One difference between strings and symbols in Scheme is that symbols are "atomic"
;; and can be compared efficiently (in constant time).  Another difference between
;; strings and symbols in Scheme is that Scheme strings can be modified (mutated),
;; while Scheme symbols are immutable.  Finally, in the quoted pair '(dog . zebra),
;; both the car and the cdr are symbols.  Similarly, in the quoted list '(lambda (x) x),
;; lambda and both occurences of x are symbols.

#|
> (lambda (x) x)
#<procedure>
> ((lambda (x) x) (+ 3 4))
7
> '(lambda (x) x)
(lambda (x) x)
> (car '(lambda (x) x))
lambda
> (symbol? (car '(lambda (x) x)))
#t
> (cadr '(lambda (x) x))
(x)
> (caadr '(lambda (x) x))
x
> (car (car (cdr '(lambda (x) x))))
x
>
|#

;; Quoted expressions + cons allow us to build up Scheme expressions
(cons 'lambda (cons '(x) (cons 'x '())))

;; Refresher on quote:
;; quoted numbers and boolean constants evaluate to themselves "self-evaluating literals"
'5  ;; => 5
'#t ;; => #t

'() ;; => ()

;; short-hand:  '<anything> is the same as (quote <anything>)
'5
(quote 5)

;; The rule for quote:  (quote <datum>) => datum  or  '<datum> => datum
(quote (cat (dog) #t () 5)) ;; => (cat (dog) #t () 5)
'(cat (dog) #t () 5)        ;; => (cat (dog) #t () 5)

(quote (foo . bar)) ;; => (foo . bar)
'(foo . bar)        ;; => (foo . bar)

(quote (5 . #f)) ;; => (5 . #f)
'(5 . #f)        ;; => (5 . #f)


;; Quasiquotation

(cons 'I (cons 'love (cons 'Scheme (cons 'programming '()))))
'(I love Scheme programming)

'(I love miniKanren programming)

'(I love 68k-assembly programming)

(let ((language 'Scheme))
  (cons 'I (cons 'love (cons language (cons 'programming '())))))

(let ((language 'miniKanren))
  (cons 'I (cons 'love (cons language (cons 'programming '())))))

(let ((language '68k-assembly))
  (cons 'I (cons 'love (cons language (cons 'programming '())))))

(define love-language
  (lambda (language)
    (cons 'I (cons 'love (cons language (cons 'programming '()))))))

(love-language 'Scheme)
(love-language 'miniKanren)
(love-language '68k-assembly)
(love-language 'Racket)

;; We can use quasiquote and unquote to make the definition of our function
;; shorter, and to more closely resemble the list we want to create: 
(define love-language-quasi
  (lambda (language)
    `(I love ,language programming)))

(love-language-quasi 'Scheme)
(love-language-quasi 'miniKanren)
(love-language-quasi '68k-assembly)
(love-language-quasi 'Racket)

;; This is the expanded form of the ` and , usage in love-language-quasi,
;; and is exactly equivalent.
(define love-language-quasi-long
  (lambda (language)
    (quasiquote (I love (unquote language) programming))))

(love-language-quasi-long 'Scheme)
(love-language-quasi-long 'miniKanren)
(love-language-quasi-long '68k-assembly)
(love-language-quasi-long 'Racket)


(define emotion-language-quasi
  (lambda (emotion language)
    `(I ,emotion ,language programming)))

(emotion-language-quasi 'love 'Scheme)
(emotion-language-quasi 'mumble 'C#)


(define simple-recursive-function-template
  (lambda (name base-case-value operator)
    `(define ,name
       (lambda (ls)
         (cond
           ((null? ls) ,base-case-value)
           (else (,operator (,name (cdr ls)))))))))

(simple-recursive-function-template 'length '0 'add1)

(define length
  (lambda (ls)
    (cond
      ((null? ls) 0)
      (else (add1 (length (cdr ls)))))))

;; Mistake!  Need to be careful to not choose variable names that are "captured"
;; by bindings in the template code.
(simple-recursive-function-template 'ls '0 'add1)

(define ls
  (lambda (ls)
    (cond
      ((null? ls) 0)
      (else (add1 (ls (cdr ls)))))))


;; unquote-splicing, or ,@
;; used to "splice in" a list in a quasiquoted value

(let ((x '(cat dog mouse)))
  `(my favorite animals : fish ,x elephant))
;; (my favorite animals : fish (cat dog mouse) elephant)

(let ((x '(cat dog mouse)))
  `(my favorite animals : fish ,@x elephant))
;; => (my favorite animals : fish cat dog mouse elephant)

;; The expression above is equivalent to this expression:
(let ((x '(cat dog mouse)))
  `(my favorite animals : fish (unquote-splicing x) elephant))
;; => (my favorite animals : fish cat dog mouse elephant)



;; Pattern matching!
(define l1 '(I love Scheme programming))
(define l2 '(I love Racket programming))
(define l3 '(I love 68k-assembly programming))
(define l4 '(I love miniKanren programming))

;; our task is, given one of the lists above, return the programming language

(define get-language
  (lambda (ls)
    (caddr ls)))

(get-language l1)
(get-language l2)

#|
;; If we wanted to be picky, and only accept lists of the form
;; (I love <language> programming), we would have to write code
;; something like this:

(define picky-get-language
  (lambda (ls)
    (if (not (null? ls))
        (if (equal? (car ls) 'I)
            (if (not (null? (cdr ls)))
                (if (equal? (cadr ls) 'love)
                    (if (not (null? (cddr ls)))
                        (if (not (null? (cdddr ls)))
                            (if (equal? (caddr ls) 'programming)
                                (if (null? (cddddr ls))
                                    (caddr ls)
                                    (error '))

Horrible!!!  We're not going to do this!!
|#



(define picky-get-language
  (lambda (ls)
    (match ls
      (`(I love ,language programming) ;; pattern
       language ;; template
       ))))


(picky-get-language l1)


(picky-get-language '(I love Haskell programming))
;; (picky-get-language '(I mumble C# programming))  ;; match error!




(define picky-get-emotion-and-language
  (lambda (ls)
    (match ls
      (`(I ,emotion ,language programming) ;; pattern
       (list emotion language) ;; template
       ))))

(picky-get-emotion-and-language l1)
(picky-get-emotion-and-language '(I love Haskell programming))
(picky-get-emotion-and-language '(I mumble C# programming))

(define add-third-and-fourth
  (lambda (lon)
    (match lon
      (`(,n1 ,n2 ,n3 ,n4 ,n5 ,n6)
       (+ n3 n4)))))

(add-third-and-fourth '(6 3 2 9 10 3))


(define goofy
  (lambda (lon)
    (match lon
      (`() 0)
      (`(,n) (* n n))
      (`(,n1 ,n2 ,n3 ,n4 ,n5 ,n6)
       (+ n3 n4))
      (`(,n1 . ,rest)
       n1))))

(goofy '())
(goofy '(5))
(goofy '(6 7))
(goofy '(8 7 6 5 4 3))


#|
(cond
  ((null? ls) '())
  (else (f (cdr ls))))

is equivalent to

(if (null? ls)
    '()
    (f (cdr ls)))
|#

(define simple-cond->if
  (lambda (expr)
    (match expr
      (`(cond
          (,test1 ,value1)
          (else ,value2))
       `(if ,test1
            ,value1
            ,value2)))))


(simple-cond->if '(cond
                    ((null? ls) '())
                    (else (f (cdr ls)))))
;; => (if (null? ls) '() (f (cdr ls)))

