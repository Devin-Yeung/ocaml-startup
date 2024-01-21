type student = {
  name: string;
  year: int;
}

let devin: student = {
  name = "Devin Yeung";
  year = 2025;
}

let dorothy: student = {
  devin with name = "Dorothy"; (* this is not mutation *)
}
(* val dorothy : student = {name = "Dorothy"; year = 2025} *)
(* devin is still the same, it's immutable *)