type 'a tree =
  | Leaf
  | Node of 'a * 'a tree * 'a tree

let t = Node (2, Node (1, Leaf, Leaf), Node (3, Leaf, Leaf))

let rec size = function
  | Leaf -> 0
  | Node (_, l, r) -> 1 + size l + size r
;;

let rec sum = function
  | Leaf -> 0
  | Node (v, l, r) -> v + sum l + sum r
;;

let rec map f = function
  | Leaf -> Leaf
  | Node (v, l, r) -> Node (f v, map f l, map f r)
;;

(* Add 1 *)
let%test _ = map succ t = Node (3, Node (2, Leaf, Leaf), Node (4, Leaf, Leaf))
let add1 t = map succ t

let rec fold acc f = function
  | Leaf -> acc
  | Node (v, l, r) -> f v (fold acc f l) (fold acc f r)
;;

let sum t = fold 0 (fun x y z -> x + y + z) t
let%test _ = fold 0 (fun x y z -> x + y + z) t = 6
let%test _ = t |> add1 |> sum == 9
