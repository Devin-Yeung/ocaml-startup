let double x = 2 * x

(* Apply a func twice *)
let twice f x = f (f x)
let quad (x : int) = twice double @@ x
let quad = twice double (* also work! *)
