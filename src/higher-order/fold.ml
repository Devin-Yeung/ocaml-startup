let rec sum = function
  | [] -> 0
  | h :: t -> h + sum t
;;

let rec concat = function
  | [] -> ""
  | h :: t -> h ^ concat t
;;

let rec combine init op = function
  | [] -> init
  | h :: t -> op h (combine init op t (*the rest of element*))
;;

let sum' lst = combine 0 ( + ) lst
let concat' = combine "" ( ^ )
let%test _ = sum' [ 1; 2; 3 ] = 6
let%test _ = concat' [ "1"; "2"; "3" ] = "123"

(* Tail Recursive *)
let rec fold_right f lst acc =
  match lst with
  | [] -> acc
  | h :: t -> f h (fold_right f t acc)
;;

(* Not Tail Recursive *)
let rec fold_left f acc lst =
  match lst with
  | [] -> acc
  | h :: t ->
    let acc' = f acc h in
    fold_left f acc' t
;;

let%test _ = fold_right ( - ) [ 1; 2; 3 ] 0 = 2
let%test _ = fold_left ( - ) 0 [ 1; 2; 3 ] = -6
