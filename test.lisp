; CONFIDENCE TEST FOR IMPLEMENTATION OF SRFI-26
; =============================================
;
; Sebastian.Egner@philips.com, 3-Jun-2002.
;
; This file checks a few assertions about the implementation.
; If you run it and no error message is issued, the implementation
; is correct on the cases that have been tested.
;
; compliance:
;   Scheme R5RS with
;     SRFI-23: error

(cl:in-package "https://github.com/g000001/srfi-26#internals")

(5am:def-suite srfi-26)
(5am:in-suite srfi-26)

(5am:test cut
  (5am:is (equal (funcall (cut #'list)) '()))
  (5am:is (equal (funcall (cut #'list <...>)) '()))
  (5am:is (equal (funcall (cut #'list 1)) '(1)))
  (5am:is (equal (funcall (cut #'list <>) 1) '(1)))
  (5am:is (equal (funcall (cut #'list <...>) 1) '(1)))
  (5am:is (equal (funcall (cut #'list 1 2)) '(1 2)))
  (5am:is (equal (funcall (cut #'list 1 <>) 2) '(1 2)))
  (5am:is (equal (funcall (cut #'list 1 <...>) 2) '(1 2)))
  (5am:is (equal (funcall (cut #'list 1 <...>) 2 3 4) '(1 2 3 4)))
  (5am:is (equal (funcall (cut #'list 1 <> 3 <>) 2 4) '(1 2 3 4)))
  (5am:is (equal (funcall (cut #'list 1 <> 3 <...>) 2 4 5 6) '(1 2 3 4 5 6)))
  (5am:is (equal (let* ((x 'wrong) (y (cut #'list x)))
                   (setq x 'ok) (funcall y))
                 '(ok)))
  (5am:is (equal
           (let ((a 0))
             (mapcar (cut #'+ (progn (setq a (+ a 1)) a) <>)
                     '(1 2))
             a)
           2)) )

(5am:test cute
  (5am:is (equal (funcall (cute #'list)) '()))
  (5am:is (equal (funcall (cute #'list <...>)) '()))
  (5am:is (equal (funcall (cute #'list 1)) '(1)))
  (5am:is (equal (funcall (cute #'list <>) 1) '(1)))
  (5am:is (equal (funcall (cute #'list <...>) 1) '(1)))
  (5am:is (equal (funcall (cute #'list 1 2)) '(1 2)))
  (5am:is (equal (funcall (cute #'list 1 <>) 2) '(1 2)))
  (5am:is (equal (funcall (cute #'list 1 <...>) 2) '(1 2)))
  (5am:is (equal (funcall (cute #'list 1 <...>) 2 3 4) '(1 2 3 4)))
  (5am:is (equal (funcall (cute #'list 1 <> 3 <>) 2 4) '(1 2 3 4)))
  (5am:is (equal (funcall (cute #'list 1 <> 3 <...>) 2 4 5 6) '(1 2 3 4 5 6)))
  (5am:is (equal
           (let ((a 0))
             (mapcar (cute #'+ (progn (setq a (+ a 1)) a) <>)
                     '(1 2))
             a)
           1)))
