;;;; srfi-26.asd

(cl:in-package :asdf)

(defsystem :srfi-26
  :serial t
  :depends-on (:mbe)
  :components ((:file "package")
               (:file "srfi-26")))

(defmethod perform :after ((o load-op) (c (eql (find-system :srfi-26))))
  (let ((name "https://github.com/g000001/srfi-26")
        (nickname :srfi-26))
    (if (and (find-package nickname)
             (not (eq (find-package nickname)
                      (find-package name))))
        (warn "~A: A package with name ~A already exists." name nickname)
        (rename-package name name `(,nickname)))))

(defsystem :srfi-26.test
  :serial t
  :depends-on (:mbe :srfi-26 :fiveam)
  :components ((:file "test")))

(defmethod perform ((o test-op) (c (eql (find-system :srfi-26.test))))
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
        (let ((result (funcall (_ :fiveam :run)
                               (_ "https://github.com/g000001/srfi-26#internals" :srfi-26))))
           (funcall (_ :fiveam :explain!) result)
           (funcall (_ :fiveam :results-status) result)))
      (error "test-op failed") ))

