# SRFI-26 in CL: Notation for Specializing Parameters without Currying

Sebastian.Egner@philips.com, 5-Jun-2002.
adapted from the posting by Al Petrofsky <al@petrofsky.org>
placed in the public domain

The code to handle the variable argument case was originally
proposed by Michael Sperber and has been adapted to the new
syntax of the macro using an explicit rest-slot symbol. The
code to evaluate the non-slots for cute has been proposed by
Dale Jordan. The code to allow a slot for the procedure position
and to process the macro using an internal macro is based on
a suggestion by Al Petrofsky. The code found below is, with
exception of this header and some changes in variable names,
entirely written by Al Petrofsky.

```cl
(mapcar (cut #'list 1 2 <> 3)
        '(1 2 3 4))
;=> ((1 2 1 3) (1 2 2 3) (1 2 3 3) (1 2 4 3))

(let ((list #'list*))
  (mapcar (cut list 1 2 <> 3)
          '(1 2 3 4)))
;=> ((1 2 1 . 3) (1 2 2 . 3) (1 2 3 . 3) (1 2 4 . 3))
```
