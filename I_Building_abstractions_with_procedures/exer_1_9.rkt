#lang racket

(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(define (plus a b)
  (if (= a 0)
      b
      (inc (plus (dec a) b))))

;linear recursive process
;(plus 4 5)            
;(inc (plus 3 5))
;(inc (inc (plus 2 5)))
;(inc (inc (inc (plus 1 5))))
;(inc (inc (inc (inc (plus 0 5)))))
;(inc (inc (inc (inc (5)))))
;(inc (inc (inc (6))))
;(inc (inc (7)))
;(inc (8))
;(9)


(define (another-plus a b)
  (if (= a 0)
      b
      (another-plus (dec a) (inc b))))

;linear iterative process
;(another-plus 4 5)
;(another-plus 3 6)
;(another-plus 2 7)
;(another-plus 1 8)
;(another-plus 0 9)
;(9)