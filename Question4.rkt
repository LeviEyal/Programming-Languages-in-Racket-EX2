#lang pl
#|********************************************************************************************
  ██████╗  ██╗   ██╗ ███████╗ ███████╗ ████████╗ ██╗  ██████╗  ███╗   ██╗     ██╗  ██╗
 ██╔═══██╗ ██║   ██║ ██╔════╝ ██╔════╝ ╚══██╔══╝ ██║ ██╔═══██╗ ████╗  ██║     ██║  ██║
 ██║   ██║ ██║   ██║ █████╗   ███████╗    ██║    ██║ ██║   ██║ ██╔██╗ ██║     ███████║
 ██║▄▄ ██║ ██║   ██║ ██╔══╝   ╚════██║    ██║    ██║ ██║   ██║ ██║╚██╗██║     ╚════██║
 ╚██████╔╝ ╚██████╔╝ ███████╗ ███████║    ██║    ██║ ╚██████╔╝ ██║ ╚████║          ██║
  ╚══▀▀═╝   ╚═════╝  ╚══════╝ ╚══════╝    ╚═╝    ╚═╝  ╚═════╝  ╚═╝  ╚═══╝          ╚═╝
********************************************************************************************|#

(define-type BINTREE
  [Leaf Number]
  [Node BINTREE BINTREE])

(: tree-map : (Number -> Number) BINTREE -> BINTREE)
(define (tree-map f bt)
  (cases bt
     [(Leaf n) (Leaf (f n))]
     [(Node left right) (Node (tree-map f left) (tree-map f right))]))

(test (tree-map add1 (Node (Leaf 1) (Node (Leaf 2) (Leaf 3)))) => (Node (Leaf 2) (Node (Leaf 3) (Leaf 4))))


;; ********************** Question 4.d **********************
(: tree-fold : (All (A) (A A -> A) (Number -> A) BINTREE -> A))
(define (tree-fold f lf tree)
  (cases tree
     [(Leaf n) (lf n)]
     [(Node left right) (f (tree-fold f lf left) (tree-fold f lf right))]))

(: tree-flatten : BINTREE -> (Listof Number))
;; flattens a binary tree to a list of its values in
;; left-to-right order
(define (tree-flatten tree)
 (tree-fold (inst append Number) (inst list Number) tree))

;; TESTS
(test (tree-flatten (Node (Leaf 1) (Node (Leaf 2) (Leaf 3)))) => '(1 2 3))
#|
               __|__
              /     \
             /\     /\
            5 /\   2  3
             8  3   
|#

(test (tree-flatten (Node (Node (Leaf 5) (Node (Leaf 8) (Leaf 3))) (Node (Leaf 2) (Leaf 3)))) => '(5 8 3 2 3))

;; ********************** Question 4.g **********************


(: switch-nodes : BINTREE BINTREE -> BINTREE)
(define (switch-nodes n1 n2)
  (Node n2 n1))

(: tree-reverse : BINTREE -> BINTREE)
(define (tree-reverse tree)
  (tree-fold switch-nodes Leaf tree))

(test (equal? (reverse (tree-flatten (Node (Node (Leaf 5) (Node (Leaf 8) (Leaf 3))) (Node (Leaf 2) (Leaf 3)))))
              (tree-flatten (tree-reverse (Node (Node (Leaf 5) (Node (Leaf 8) (Leaf 3))) (Node (Leaf 2) (Leaf 3)))))) => true)