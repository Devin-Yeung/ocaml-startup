module ListQueue = struct
  type 'a queue = 'a list

  let empty = []

  (* Linear time *)
  let enqueue x q = q @ [ x ]

  let peek = function
    | [] -> None
    | x :: _ -> Some x
  ;;

  let dequeue = function
    | [] -> None
    | _ :: q -> Some q
  ;;
end

module TwoListQueue = struct
  (*
     fornt = [a; b]; back = [e; d; c]
     represents the queue a, b, c, d, e
     If [front] is empty then [back] must be empty,
  *)
  type 'a queue =
    { front : 'a list
    ; back : 'a list
    }

  let empty = { front = []; back = [] }

  let peek = function
    | { front = []; _ } -> None
    | { front = x :: _; _ } -> Some x
  ;;

  let enqueue x = function
    | { front = []; _ } -> { front = [ x ]; back = [] }
    | q -> { q with back = x :: q.back }
  ;;

  let dequeue = function
    | { front = []; _ } -> None
    | { front = _ :: []; back } ->
      Some { front = List.rev back; back = [] } (* only have one element in front *)
    | { front = _ :: q; back } -> Some { front = q; back }
  ;;
end

let%test _ =
  let open TwoListQueue in
  let open Stdlib.Option in
  empty |> enqueue 1 |> enqueue 2 |> dequeue |> get |> dequeue |> get = empty
;;

(* Option.map *)
let ( >>| ) opt f =
  match opt with
  | None -> None
  | Some x -> Some (f x)
;;

(* Option.bind *)
let ( >>= ) opt f =
  match opt with
  | None -> None
  | Some x -> f x
;;

let%test _ =
  let open TwoListQueue in
  let open Stdlib.Option in
  empty |> enqueue 1 |> enqueue 2 |> dequeue >>= dequeue = Some empty
;;
