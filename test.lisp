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

(cl:in-package :srfi-26-internal)

(def-suite srfi-26)
(in-suite srfi-26)

(test cut
  (is (equal (funcall (cut #'list)) '()))
  (is (equal (funcall (cut #'list <...>)) '()))
  (is (equal (funcall (cut #'list 1)) '(1)))
  (is (equal (funcall (cut #'list <>) 1) '(1)))
  (is (equal (funcall (cut #'list <...>) 1) '(1)))
  (is (equal (funcall (cut #'list 1 2)) '(1 2)))
  (is (equal (funcall (cut #'list 1 <>) 2) '(1 2)))
  (is (equal (funcall (cut #'list 1 <...>) 2) '(1 2)))
  (is (equal (funcall (cut #'list 1 <...>) 2 3 4) '(1 2 3 4)))
  (is (equal (funcall (cut #'list 1 <> 3 <>) 2 4) '(1 2 3 4)))
  (is (equal (funcall (cut #'list 1 <> 3 <...>) 2 4 5 6) '(1 2 3 4 5 6)))
  (is (equal (let* ((x 'wrong) (y (cut #'list x)))
               (setq x 'ok) (funcall y))
             '(ok)))
  (is (equal
       (let ((a 0))
         (mapcar (cut #'+ (progn (setq a (+ a 1)) a) <>)
                 '(1 2))
         a)
       2)) )

(test cute
  (is (equal (funcall (cute #'list)) '()))
  (is (equal (funcall (cute #'list <...>)) '()))
  (is (equal (funcall (cute #'list 1)) '(1)))
  (is (equal (funcall (cute #'list <>) 1) '(1)))
  (is (equal (funcall (cute #'list <...>) 1) '(1)))
  (is (equal (funcall (cute #'list 1 2)) '(1 2)))
  (is (equal (funcall (cute #'list 1 <>) 2) '(1 2)))
  (is (equal (funcall (cute #'list 1 <...>) 2) '(1 2)))
  (is (equal (funcall (cute #'list 1 <...>) 2 3 4) '(1 2 3 4)))
  (is (equal (funcall (cute #'list 1 <> 3 <>) 2 4) '(1 2 3 4)))
  (is (equal (funcall (cute #'list 1 <> 3 <...>) 2 4 5 6) '(1 2 3 4 5 6)))
  (is (equal
       (let ((a 0))
         (mapcar (cute #'+ (progn (setq a (+ a 1)) a) <>)
                 '(1 2))
         a)
       1)))
