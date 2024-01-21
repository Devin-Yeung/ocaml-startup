(* Application *)
(* Take function f and param x, apply f to x, that is f(x) *)
let (@@) f x = f x;;

(* Reverse Application a.k.a pipeline *)
let (|>) x f = f x;;

succ 2 * 10;;
(* which is equiv to *)
(succ 2) * 10;;
(* what if I want to mean succ (2 * 10) *)
succ @@ 2 * 10;;

(* Example: square *)
let square x = x * x;;
(* calculate ((5 + 1)^2)^2 + 1 *)
succ ( square ( square (succ 5) ) );;
(* uh.. ugly! using pipeline! *)

let%test _ = 5
|> succ
|> square
|> square
|> succ 
= 1297;; (*beautiful!*)