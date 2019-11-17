#lang racket

(define (p) (p))

(define (test x y)
  (if (= 0 x)
      0
      y))

(test 0 (p))

; applicative-order
; (test 0 (p)) -> (test 0 (p)) -> (test 0 (p)) -> ...

; normal-order
; (test 0 (p)) -> (if (=0 0) 0 (p)) -> 0