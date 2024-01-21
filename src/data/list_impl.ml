type intList =
  | Nil
  | Cons of int * intList

let rec length = function
  | Nil -> 0
  | Cons (_, t) -> 1 + length t
;;

let arr = Cons (1, Cons (2, Nil))
let%test _ = length arr = 2

(* Generic List *)

type 'a myList =
  | Nil
  | Cons of 'a * 'a myList

let rec length = function
  | Nil -> 0
  | Cons (_, t) -> 1 + length t
;;

(* Work for string now! *)
let arr = Cons ("1", Cons ("2", Nil))
let%test _ = length arr = 2
