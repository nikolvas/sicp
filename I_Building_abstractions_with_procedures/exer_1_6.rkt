#lang racket

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt x) (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve-guess guess x) x)))

; then-clause, else-clause always evaluated!
; (new-if (= 0 0) (print "then-clause") (print "else-clause"))
; > then-clause, else-clause
; (new-if (= 1 0) (print "then-clause") (print "else-clause"))
; > then-clause, else-clause
;
;
; '->' denote reduction
;
;(new-if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve-guess guess x) x)))
;-> by applicative-order
; (good-enough? guess x) - reduction to number
; guess - primitive, reduction not required
; (sqrt-iter (improve-guess guess x) x))->
;               (improve-guess guess x) - reduce to number new-guess
;                x-primitive, reduction not required  
;             ->(new-if (good-enough? new-guess x)
;                   new-guess
;                   (sqrt-iter (improve-guess guess x) x)))->... infinite reduction!!!
;

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve-guess guess x)
  (avg guess (/ x guess)))

(define (avg x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))