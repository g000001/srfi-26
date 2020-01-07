;;;; package.lisp

(cl:in-package :cl-user)

(defpackage "https://github.com/g000001/srfi-26"
  (:use)
  (:export cut cute <> <...>))

(defpackage "https://github.com/g000001/srfi-26#internals"
  (:use "https://github.com/g000001/srfi-26"
        cl
        mbe))

