type time = int * int * string

let t : time = 10, 10, "am"

type point = float * float

let p : point = 5., 3.5;;

(* p.0 *)
fst p;;

(* p.1 *)
snd p
