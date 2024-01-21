(* Comparison is polymorphic *)
(* 'a -> 'a -> bool = <fun> *)
( = );;

(* Operators As functions *)
( + ) 1 2;;

(* Define your own operator *)
let ( <^> ) x y = max x y ;;
1 <^> 2 ;;