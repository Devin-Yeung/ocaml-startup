module type DirectAddressMap = sig
  (** [t] is the type of maps that bind keys of type int to values of
      type ['v]. *)
  type 'v t

  (** [insert k v m] mutates map [m] to bind [k] to [v]. If [k] was
      already bound in [m], that binding is replaced by the binding to
      [v] in the new map. Requires: [k] is in bounds for [m]. *)
  val insert : int -> 'v -> 'v t -> unit

  (** [find k m] is [Some v] if [k] is bound to [v] in [m], and [None]
      if not. Requires: [k] is in bounds for [m]. *)
  val find : int -> 'v t -> 'v option

  (** [remove k m] mutates [m] to remove any binding of [k]. If [k] was
      not bound in [m], then the map is unchanged. Requires: [k] is in
      bounds for [m]. *)
  val remove : int -> 'v t -> unit

  (** [create c] creates a map with capacity [c]. Keys [0] through [c-1]
      are _in bounds_ for the map. *)
  val create : int -> 'v t

  (** [of_list c lst] is a map containing the same bindings as
      association list [lst] and with capacity [c]. Requires: [lst] does
      not contain any duplicate keys, and every key in [lst] is in
      bounds for capacity [c]. *)
  val of_list : int -> (int * 'v) list -> 'v t

  (** [bindings m] is an association list containing the same bindings
      as [m]. There are no duplicate keys in the list. *)
  val bindings : 'v t -> (int * 'v) list
end

module ArrayMap : DirectAddressMap = struct
  (*
     [Some(v0); Some(v1) ... Some(vn)] represent
    {0: v0, 1: v1, ... n: vn}
  *)
  type 'v t = 'v option array

  let insert k v a = a.(k) <- Some v
  let find k a = a.(k)
  let remove k a = a.(k) <- None
  let create len = Array.make len None

  let of_list c lst =
    let arr = create c in
    List.iter (fun (k, v) -> insert k v arr) lst;
    arr
  ;;

  let bindings a =
    let b = ref [] in
    for k = 0 to Array.length a - 1 do
      match a.(k) with
      | Some v -> b := (k, v) :: !b
      | None -> ()
    done;
    !b
  ;;
end

let%test "ArrayMap" =
  let open ArrayMap in
  let m = create 10 in
  insert 0 "a" m;
  insert 1 "b" m;
  remove 0 m;
  [ 1, "b" ] = bindings m
;;
