(* Comparison is polymorphic *)
(* 'a -> 'a -> bool = <fun> *)
( = );;

(* Operators As functions *)
1 + 2

(* Define your own operator *)
let ( <^> ) x y = max x y
let%test _ = 1 <^> 2 = 2
