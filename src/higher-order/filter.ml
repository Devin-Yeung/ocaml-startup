let rec evens = function
  | [] -> []
  | h :: t -> if h mod 2 = 0 then h :: evens t else evens t
;;

let rec odds = function
  | [] -> []
  | h :: t -> if h mod 2 = 1 then h :: odds t else odds t
;;

let rec filter p = function
  | [] -> []
  | h :: t -> if p h then h :: filter p t else filter p t
;;

let even x = x mod 2 = 0
let odd x = x mod 2 = 1
let evens' lst = filter even lst
let odds' lst = filter odd lst

(* Let's optimize to tail recursive *)
let rec filter_aux p acc (*lst*) = function
  | [] -> List.rev acc
  | h :: t -> filter_aux p (if p h then h :: acc else acc) t
;;

let filter p lst = filter_aux p [] lst
let%test _ = filter even [ 1; 2; 3; 4 ] = [ 2; 4 ]
