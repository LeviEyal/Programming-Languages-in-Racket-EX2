#lang pl
#|********************************************************************************************
  ██████╗  ██╗   ██╗ ███████╗ ███████╗ ████████╗ ██╗  ██████╗  ███╗   ██╗     ██████╗
 ██╔═══██╗ ██║   ██║ ██╔════╝ ██╔════╝ ╚══██╔══╝ ██║ ██╔═══██╗ ████╗  ██║     ╚════██╗
 ██║   ██║ ██║   ██║ █████╗   ███████╗    ██║    ██║ ██║   ██║ ██╔██╗ ██║      █████╔╝
 ██║▄▄ ██║ ██║   ██║ ██╔══╝   ╚════██║    ██║    ██║ ██║   ██║ ██║╚██╗██║      ╚═══██╗
 ╚██████╔╝ ╚██████╔╝ ███████╗ ███████║    ██║    ██║ ╚██████╔╝ ██║ ╚████║     ██████╔╝
  ╚══▀▀═╝   ╚═════╝  ╚══════╝ ╚══════╝    ╚═╝    ╚═╝  ╚═════╝  ╚═╝  ╚═══╝     ╚═════╝
********************************************************************************************|#

(: square : Number -> Number)
(define (square n) (* n n))

(: sum-of-squares : (Listof Number) -> Number)
(define (sum-of-squares lst)
  (foldl + 0 (map square lst)))

(test (square 3) => 9)
(test (sum-of-squares '(1 2 3)) => 14)
(test (sum-of-squares '()) => 0)
(test (sum-of-squares '(3 3 3)) => 27)
(test (sum-of-squares '(0 0 0)) => 0)
(test (sum-of-squares '(-1 -2 -3)) => 14)
(test (sum-of-squares '(0.5 0.5 0.5 0.5)) => 1.0)