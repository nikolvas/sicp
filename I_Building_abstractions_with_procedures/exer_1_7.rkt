#lang racket

(define (sqrt x) (sqrt-iter 1.0 x x))

(define (sqrt-iter guessPrev guessCur x)
  (if (good-enough? guessPrev guessCur)
      guessCur
      (sqrt-iter guessCur (improve-guess guessCur x) x)))

(define (good-enough? guessPrev guessCur)
  (< (abs (/ (- guessPrev guessCur) guessCur)) 0.001))

(define (improve-guess guess x)
  (avg guess (/ x guess)))

(define (avg x y)
  (/ (+ x y) 2.0))

(define (square x)
  (* x x))

; comparison with the previous version
;  prev               | current
;> (sqrt 0.0001)
;0.03230844833048122  | 0.010000000025490743
;> (sqrt 0.000001)
;0.031260655525445276 | 0.0010000001533016628