#lang racket

;; namespace magic to make 'eval' work properly in the file (as opposed to in the REPL)
;;
;; https://stackoverflow.com/questions/20778926/mysterious-racket-error-define-unbound-identifier-also-no-app-syntax-trans
(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))

;; quasiquote review and practice

;; regular quote
'(cat dog mouse)
'5736477
'#t

(quote (cat dog mouse))
(quote 5736477)
(quote #t)
(quote (+ 3 4)) ; => (+ 3 4)


(quote <datum>) ; => datum


;; quasiquote


;; HTML example from https://www.w3schools.com/html/html_basic.asp
;<!DOCTYPE html>
;<html>
;  <body>
;    <h1>
;      My First Heading
;    </h1>
;    <p>
;      My first paragraph.
;    </p>
;  </body>
;</html>


'(head
 (body
  (h1
   "My First Heading"
   )
  (p
   "My first paragraph."
   )
  )
 )

'(head
 (body
  (h1
   "Will's Heading"
   )
  (p
   "Will's paragraph."
   )
  )
 )


'(head
 (body
  (h1
   "McCarthy's LISP Site"
   )
  (p
   "McCarthy's text here."
   )
  )
 )




'(head
  (body
   (h1
    "Will's Heading"
    )
   (p
    "Will's paragraph."
    )
   )
  )

'(head
  (body
   (h1
    "McCarthy's LISP Site"
    )
   (p
    "McCarthy's text here."
    )
   )
  )

#|
(cons
  'head
  (cons
   (cons
    'body
    (cons
     (cons
      'h1
      (cons
       heading-string
       '())
     (cons
      (cons
       'p
       (cons
        paragraph-string
        '())
      '())
      '())
   '())))))
|#

(define heading-string "Will's Heading")
(define paragraph-string "Will's paragraph")

`(head
  (body
   (h1
    ,heading-string
    )
   (p
    ,paragraph-string
    )
   )
  )

(define make-page
  (lambda (heading-string paragraph-string)
    `(head
      (body
       (h1
        ,heading-string
        )
       (p
        ,paragraph-string
        )
       )
      )))

(make-page "Welcome to Summer Scheming!" "Hi everyone!  Scheme is cool!")
(make-page "Welcome to Summer Scheming, Lesson 08!" "It's very hot right now!")


(define make-two-part-heading-page
  (lambda (heading-string-1 heading-string-2 paragraph-string)
    `(head
      (body
       (h1
        ,(string-append heading-string-1 ": " heading-string-2)
        )
       (p
        ,(string-append "As indicated by the main heading, "
                        heading-string-1
                        ", it is important to remember "
                        paragraph-string)
        )
       )
      )))

(make-two-part-heading-page "Summer Scheming helps cool you off"
                            "Scheme and Racket are Refreshing!"
                            "programming will keep you chill.")


(quote <datum>) ;; => <datum>
(quasiquote <almost-constant-datum>) ;; <almost-constant-datum>, but with (unquote ...)
                                     ;; subexpressions evaluated normally

;; pattern-matching

#|
(define uppercase-page-heading
  (lambda (page)
    (cond
      ((and (list? page) (= (length page) 2) (equal? (car page) 'head)) ;; match head element: (head <element>)
       (let ((child-element (cadr page)))
         <do something with the head's child element>))
      ((and (list? page) (>= (length page) 1) (equal? (car page) 'body))
       ) ;; (body <element> ...)      
      (else ))))
|#

(define uppercase-element-tags
  (lambda (element)
    (match element ;;
      (`(head ,e) ;; pattern   
       `(HEAD ,(uppercase-element-tags e)))
      (`(body ,e1 ,e2) ;; 
       `(BODY ,(uppercase-element-tags e1) ,(uppercase-element-tags e2)))
      (`(h1 ,str)
       `(H1 ,(string-upcase str)))
      (`(p ,str)
       `(P ,str)))))

(uppercase-element-tags '(head (body (h1 "Will's Heading") (p "Will's paragraph"))))


(define uppercase-h1
  (lambda (element)
    (match element
      (`(head ,e)
       `(head ,(uppercase-h1 e)))
      (`(body ,e1 ,e2) ;; 
       `(body ,(uppercase-h1 e1) ,(uppercase-h1 e2)))
      (`(h1 ,str)
       `(h1 ,(string-upcase str)))
      (`(p ,str)
       `(p ,str)))))

(uppercase-h1 '(head (body (h1 "Will's Heading") (p "Will's paragraph"))))

(define uppercase-h1-cond
  (lambda (element)
    (cond
      ((and (list? element) (= 2 (length element)) (equal? (car element) 'head)) ;; (head ,e)
       (let ((e (car (cdr element))))
         (cons 'head (cons (uppercase-h1-cond e) '()))))
      ;; etc.
      )))

;; (uppercase-h1-cond '(head (body (h1 "Will's Heading") (p "Will's paragraph"))))

#|
(head <element>)
(body <element>)
(h1 <string>)
(p <string>)
|#




(define generate-html
  (lambda (element)
    (match element
      (`(head ,e)
       (string-append
        "<!DOCTYPE html>\n<html>\n"
        (generate-html e)
        "</html>"))
      (`(body ,e1 ,e2) ;;
       (string-append
        "<body>\n"
        (generate-html e1)
        "\n"
        (generate-html e2)
        "\n</body>"))
      (`(h1 ,str)
       (string-append "<h1>\n" str "\n</h1>"))
      (`(p ,str)
       (string-append "<p>\n" str "\n</p>")))))

(display
 (generate-html
  (uppercase-h1
   '(head (body (h1 "Will's Heading") (p "Will's paragraph"))))))

;; compiler

;; interpreter



