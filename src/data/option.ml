type 'a option =
  | None
  | Some of 'a

let get_or_default default = function
  | None -> default
  | Some x -> x
;;

let rec list_max (lst : 'a list) : 'a option =
  match lst with
  | [] -> None
  | h :: t ->
    (match list_max t with
     | None -> Some h
     | Some m -> Some (max h m))
;;

let%test _ = list_max [] = None
let%test _ = list_max [1; 2; 3] = Some 3