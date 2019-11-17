#lang racket

(require rackunit
         "exer_1_3.rkt")

(check-equal? (sum-of-square-maxes 1 2 3) 13 "1 2 3")
(check-equal? (sum-of-square-maxes 4 4 4) 32 "4 4 4")
(check-equal? (sum-of-square-maxes 10 10 -100) 200 "10 10 -10")
(check-equal? (sum-of-square-maxes 3 4 5) 41 "3 4 5")
(check-equal? (sum-of-square-maxes 3 5 4) 41 "3 5 4")
(check-equal? (sum-of-square-maxes 4 3 5) 41 "4 3 5")
(check-equal? (sum-of-square-maxes 4 5 3) 41 "4 5 3")
(check-equal? (sum-of-square-maxes 5 3 4) 41 "5 3 4")
(check-equal? (sum-of-square-maxes 5 4 3) 41 "5 4 3")
