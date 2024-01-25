module type X = sig
  val x : int
end

module A : X = struct
  let x = 0
end

module IncX =
functor
  (M : X)
  ->
  (* take module as input *)
  struct
    let x = M.x + 1
  end

module B = IncX (A)

let%test _ =
  let open B in
  x == 1
;;
