(* Algebraic Data Types *)

(*
  Records and Tuples: *each-of* types
  - Aka *product* types

  Variants: *one-of* types
  - Aka *sum* types
  - Aka tagged union
*)

type string_or_int =
  | String of string
  | Int of int

(* Tagged Union *)
type blue_or_pink_int =
  | Blue of int
  | Pink of int

(* Let's Build Pokemon! *)

(* Pokenmon Type *)
type ptype =
  | TNormal
  | TFire
  | TWater

(* effectiveness *)
type peff =
  | ENormal
  | ENotVery
  | ESuper

let mult_of_eff = function
  | ENormal -> 1.0
  | ENotVery -> 0.5
  | ESuper -> 2.0
;;

let eff t1 t2 =
  match t1, t2 with
  | TFire, TFire | TWater, TWater | TFire, TWater -> ENotVery
  | TWater, TFire -> ESuper
  | _ -> ENormal
;;

type mon =
  { name : string
  ; hp : int
  ; ptype : ptype
  }

let%test _ = eff TFire TFire = ENotVery
