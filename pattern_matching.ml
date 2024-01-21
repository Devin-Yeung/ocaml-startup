let x =
  match not true with
  | true -> "nope"
  | false -> "yep"

let y =
  match 42 with
  | foo -> foo

let z =
  match "foo" with
  | "bar" -> 0
  | _ -> 1

let a =
  match [] with
  | [] -> "empty"
  | _ -> "not empty"

let b =
  match ["taylor"; "swift"] with
  | [] -> "folklore"
  | h :: t -> h

(* check if list is empty *)
let empty lst =
  match lst with
  | [] -> true
  | h(*head*) :: t(*tail*) -> false

let rec sum lst =
  match lst with
  | [] -> 0
  | h :: t -> h + sum t
(* try #trace sum in utop to check the recursive call *)

let rec length lst =
  match lst with
  | [] -> 0
  | h :: t -> 1 + length t


(* example useage:
  append [1; 2; 3] [4; 5; 6] is [1; 2; 3; 4; 5; 6]
*)
let rec append lst1 lst2 =
  match lst1 with
  | [] -> lst2
  | h :: t -> h :: (append t lst2)