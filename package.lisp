;;;; package.lisp

(cl:in-package :cl-user)

(defpackage :srfi-26
  (:export :cut :cute :<> :<...>))

(defpackage :srfi-26-internal
  (:use :srfi-26 :cl :fiveam
        :mbe))
