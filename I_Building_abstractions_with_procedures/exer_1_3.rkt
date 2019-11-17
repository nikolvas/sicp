#lang racket

(define (max x y) (if (>= x y) x y))
(define (min x y) (if (<= x y) x y))

(define (square x) (* x x))
(define (sum-of-square x y) (+ (square x) (square y)))

(define (sum-of-square-maxes x y z)
         (sum-of-square (max x y) (max (min x y) z)) 
)
;(sum-of-square-maxes 1 2 3)

(provide sum-of-square-maxes)
