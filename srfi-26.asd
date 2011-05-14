;;;; srfi-26.asd

(cl:in-package :asdf)

(defsystem :srfi-26
  :serial t
  :depends-on (:mbe)
  :components ((:file "package")
               (:file "srfi-26")
               (:file "test")))

(defmethod perform ((o test-op) (c (eql (find-system :srfi-26))))
  (load-system :srfi-26)
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
         (let ((result (funcall (_ :fiveam :run) (_ :srfi-26-internal :srfi-26))))
           (funcall (_ :fiveam :explain!) result)
           (funcall (_ :fiveam :results-status) result)))
      (error "test-op failed") ))

