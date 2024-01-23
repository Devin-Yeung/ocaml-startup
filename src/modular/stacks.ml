module type ListStackSig = sig
  type 'a stack

  val empty : 'a stack
  val push : 'a -> 'a stack -> 'a stack
  val peek : 'a stack -> 'a option
  val pop : 'a stack -> 'a stack
end

module MyStack : ListStackSig = struct
  type 'a stack =
    | Empty
    | Entry of 'a * 'a stack

  let empty = Empty
  let push x s = Entry (x, s)

  let peek = function
    | Empty -> None
    | Entry (x, _) -> Some x
  ;;

  (* No mutable updates: operations take and "old" value and return "new" value *)
  let pop = function
    | Empty -> failwith "Empty"
    | Entry (_, s) -> s
  ;;
end

module ListStack : ListStackSig = struct
  type 'a stack = 'a list

  let empty = []
  let push x s = x :: s

  let peek = function
    | [] -> None
    | x :: _ -> Some x
  ;;

  (* No mutable updates: operations take and "old" value and return "new" value *)
  let pop = function
    | [] -> failwith "Empty"
    | _ :: s -> s
  ;;
end

let x = ListStack.(empty |> push 42 |> peek)

(* Local Open *)
let w =
  let open ListStack in
  empty |> push 42 |> peek
;;
