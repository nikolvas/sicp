#lang racket
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; (A 1 10) -> (A 0 (A 1 9)) -> (A 0 (A 0 (A 1 8)) ->
; (A 0 (A 0 (A 0 (A 1 7)))) -> ... -> (A 0 (A 0 (A 0 ... (A 0 1)))) ->
; (A 0 (A 0 (A 0 ... (2)))) -> (A 0 (A 0 (A 0 ...(* 2 2)))) -> ... ->
; (* 2 (* 2 (* 2 ...(2)..) -> 2^10

; (A 2 4) -> (A 1 (A 2 3)) -> (A 1 (A 1 (A 2 2))) ->
; (A 1 (A 1 (A 1 (A 2 1))))-> (A 1 (A 1 (A 1 2))) ->
; (A 1 (A 1 (A 0 (A 1 1))) -> (A 1 (A 1 (A 0 2)) ->
; (A 1 (A 1 4)) -> ...<see prev. example > -> (A 1 2^4) -> 2^(2^4) -> 2^16

; (A 3 3) -> (A 2 (A 3 2)) -> (A 2 (A 2 (A 3 1))) ->
; (A 2 (A 2 2)) -> (A 2 (A 1 (A 2 1))) -> ( A 2 (A 1 2))) ->
; (A 2 (A 0 (A 1 1))) -> (A 2 (A 0 2)) -> (A 2 4) -> 2^16

(define (f n) (A 0 n))
;(define (f n) (* 2 n))
; 2*n

(define (g n) (A 1 n))
;(define (g n) (expt 2 n))
; 2^n

(define (h n) (A 2 n))
;   n   | 0 | 1 | 2 |  3|     4
; (h n) | 0 | 2 | 4 | 16| 65536
; (define (h n)
;   (cond ((= n 0) 0)
;         ((= 1 n) 2)
;         (else (expt 2 (h (- n 1))))))
; 2^2^2...^2(n-times)

(define (k n) (* 5 n n))