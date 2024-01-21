(* exn is an *extensible* variant *)
(* this is a constructor of one the variant in exn *)
exception OhNo of string

(* raise (OhNo "oops") *)

(* 
  signature of raise:
  raise: exn -> 'a
  
  Since if you raise an exception, it never *produce* a value
  (similiar to never! type in rust), so we can treat it as return any type we want 'a
  ```ocaml
  let x : int = raise (OhNo "oops");;
  ```
*)

(* 
  Two useful built-in   

  failwith : string -> 'a
  invalid_arg : string -> 'a
  
*)

(* Error Handling *)

let safe_div x y =
  try x / y with
  | Division_by_zero -> 0
;;

(* 
  try .. with is a non exhaustive match (slightly different from match .. with),
  if no exception(s) match, *re-raise* the exception
*)

let%test _ = safe_div 1 0 = 0
