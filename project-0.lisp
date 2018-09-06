(defun TODO (thing)
  (error "Unimplemented: ~A" thing))

;; Return T if item is a member of set.
;; Return NIL if item is not a member of set.
;; The type of set is list.
;;

;; Examples:
;;  (set-member '(1 2) 1) => T
;;  (set-member '(1 2) 3) =>  NIL
(defun set-member (set item)
  (if (not set)
    nil
    (if (eql item (car set))
        t
        (set-member (cdr set) item) 
    )
  )
)

;; Return the union of set-1 and set-2.
;; The result should contain no duplicates.
;; Assume set-1 contains no duplicates and set-2 contains no duplicates.
;;
;; Examples:
;;   (set-union '(1 2) '(2 4)) => '(1 2 4)
(defun set-union (set-1 set-2)
  (if (not set-2)
    set-1 
    (if (set-member set-1 (car set-2))
        (set-union (cdr set-2) set-1)
        (set-union (append set-1 (list (car set-2))) (cdr set-2))  
    )
  )
)
  
;; Return the intersection of set-1 and set-2.
;; The result should contain no duplicates.
;; Assume set-1 contains no duplicates and set-2 contains no duplicates.
;;

;; Examples:
;;   (set-intersection '(1 2) '(2 4)) => '(2)
(defun set-intersection (set-1 set-2)
  (if (not set-1)
       set-1
      (if (set-member set-2 (car set-1))
	  (cons (car set-1) (set-intersection (cdr set-1) set-2))
	  (set-intersection (cdr set-1) set-2))))
      
;; Return the difference of set-1 and set-2.
;; The result should contain no duplicates.
;; Assume set-1 contains no duplicates and set-2 contains no duplicates.
;;
;; Examples:
;;   (set-diff '(1 2) '(2 4)) => '(1)
(defun set-diff (set-1 set-2)
  (if (not set-1)
       set-1
      (if (set-member set-2 (car set-1))
	  (set-diff (cdr set-1) set-2)
	  (cons (car set-1) (set-diff (cdr set-1) set-2)))))

;; Return the exclusive or of a and b
;;
;; Examples:
;;  (boolean-xor t nil) => t
;;  (boolean-xor nil nil) => nil
(defun boolean-xor (a b)
    (if (eql a b)
        nil
        t)
)
;; Return the implication of a and b
;;
;; Examples:
;;  (boolean-implies t nil) => nil
;;  (boolean-implies nil nil) => t
(defun boolean-implies (a b)
    (if (eql a b)
        t
        (if b
        t
        nil)
    )
)

;; Return the bi-implication (if and only if) of a and b
;;
;; Examples:
;;  (boolean-iff t nil) => nil
;;  (boolean-iff nil nil) => t
(defun boolean-iff (a b)
    (if (eql a b)
        t
        nil)
)
;; Evaluate a boolean expression.
;; Handle NOT, AND, OR, XOR, IMPLIES, and IFF.
;;
;; Examples:
;;  (boolean-eval '(and t nil)) => nil
;;  (boolean-eval '(and t (or nil t)) => t
(defun boolean-eval (exp)
  (cond
    ((equal t exp) t)
    ((equal 'not (car exp))  nil)
    ((equalp (FIRST exp) (FIRST '(NOT t))) (NOT (boolean-eval (SECOND exp)) (boolean-eval (THIRD exp))))
    ((equalp (FIRST exp) (FIRST '(AND t t))) (AND (boolean-eval (SECOND exp)) (boolean-eval (THIRD exp))))
    ((equalp (FIRST exp) (FIRST '(OR t t))) (OR (boolean-eval (SECOND exp)) (boolean-eval (THIRD exp))))
    ((equalp (FIRST exp) (FIRST '(XOR t))) (boolean-xor (boolean-eval (SECOND exp)) (boolean-eval (THIRD exp))))
    ((equalp (FIRST exp) (FIRST '(IMPLIES t))) (boolean-implies (boolean-eval (SECOND exp)) (boolean-eval (THIRD exp))))
    ((equalp (FIRST exp) (FIRST '(IFF t))) (boolean-iff (boolean-eval (SECOND exp)) (boolean-eval (THIRD exp))))
    (t
    nil)))

;; Perform the left fold on the list
;;
;; Examples:
;;   (fold-left #'- 1 '(2 3)) => -4
(defun fold-left (function initial-value list)
    (if list
        (fold-left function (funcall function initial-value (car list)) (cdr list))
        initial-value)
)

;; Perform the right fold on the list
;;
;;   (fold-right #'- 1 '(2 3)) => 0
(defun fold-right (function initial-value list)
    (if list
        (funcall function (car list) (fold-right function initial-value (cdr list)))
        initial-value
    )
)
