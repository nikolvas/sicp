#lang racket

; Newton’s method
; f(guess) = guess^3 - x,
; guess denotes by g
; gk+1 = gk - (f(gk)/f'(gk)) => gk+1=gk - (gk^3-x)/3gk^2 = (2gk^3+x)/3gk^2 = (2gk + x/gk^2 / 3
;
; https://math.stackexchange.com/a/575295

(define (sqrt3 x) (sqrt-iter 1.0 x x improve-guess3))

(define (sqrt2 x) (sqrt-iter 1.0 x x improve-guess2))

(define (sqrt-iter guessPrev guessCur x improve-guess)
  (if (good-enough? guessPrev guessCur)
      guessCur
      (sqrt-iter guessCur (improve-guess guessCur x) x improve-guess)))

(define (good-enough? guessPrev guessCur)
  (< (abs (/ (- guessPrev guessCur) guessCur)) 0.001))

(define (improve-guess2 guess x)
  (avg guess (/ x guess)))

(define (square x)
  (* x x))      

(define (improve-guess3 guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3.0))

(define (avg x y)
  (/ (+ x y) 2.0))

