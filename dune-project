(lang dune 3.4)

(package
 (name ocaml-startup)
 (depends
  ppx_inline_test
  (ocaml
   (>= 4.02.3))
  dune))