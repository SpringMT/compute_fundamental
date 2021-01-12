#use "ex20_2.ml"

let rec search tree k = match tree with
  Empty -> raise Not_found
  | Node(t1, key, value, color, t2) ->
    if k = key then
      value
    else if k < key then
      search t1 k
    else
      search t2 k
(* テスト *)
let rb_tree =
  Node (Node (Empty, 10, "x", Black, Empty), 13, "y", Red,
	Node (Empty, 15, "z", Black, Empty))
let test1 = search rb_tree 10 = "x"
let test2 = search rb_tree 13 = "y"
let test3 = search rb_tree 15 = "z"
(* let test4 = search rb_tree 17 *)
   (* Not_found を起こす *)