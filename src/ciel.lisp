(in-package :cl-user)
(defpackage ciel
  (:use :cl
        :alexandria
        :arrow-macros
        :cl-csv
        :cl-ppcre
        :defclass-std
        :fn
        :for
        :local-time
        :modf
        :parse-float
        :cl-ansi-text
        :trivia
        :trivial-arguments

;; conflicts:
;; iterate and for
;; sxql::returning and for::returning
;; dissect:object and for-iterator:object


(defpackage ciel-user
  (:use :cl
        :ciel))

(defpackage generic-ciel
  (:use :generic-cl
        :ciel))

(in-package :ciel)

;; Enable ^(* 2 _) syntax.
(cl-punch:enable-punch-syntax)

;; Enable triple quotes for the functions docstring.
;; (in-readtable pythonic-string-reader:pythonic-string-syntax)
(pythonic-string-reader:enable-pythonic-string-syntax)
