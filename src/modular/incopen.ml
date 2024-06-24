module M = struct
  let x = 0
end

(*
   sig
   val x: int
   val y: int
   end
*)
module N = struct
  include M

  let y = x + 1
end

(*
   sig
   val y: int
   end
*)
module O = struct
  open M

  let y = x + 1
end
