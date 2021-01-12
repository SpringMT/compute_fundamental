#use "ex20_2.ml"

(* 赤栗木とキーと値を受け取ったらキーと値を挿入した赤黒木を返す *)
(* insert:rb_tree_t -> 'a -> 'b -> rb_tree_t *)

let rec insert tree k v =
  let rec ins tree = match tree with
    Empty -> Node (Empty, k, v, Red, Empty)
    | Node(t1, key, value, color, t2) ->
      if k = key then
        Node(t1, k, v, color, t2)
      else if k < key then
        balance (Node (ins t1, key, value, color, t2))
      else
        balance (Node (t1, key, value, color, ins t2))
   in match ins tree with
     Empty -> assert false (* 絶対に空ではない *)
     | Node (left, key, value, color, right) ->
        Node (left, key, value, Black, right)

(* テスト *)
let rb_tree0 = Empty
let rb_tree1 = insert rb_tree0 10 "x"
let rb_tree2 = insert rb_tree1 13 "y"
let rb_tree3 = insert rb_tree2 15 "z"

let test1 = rb_tree1 = Node (Empty, 10, "x", Black, Empty)
let test2 = rb_tree2 = Node (Empty, 10, "x", Black,
			     Node (Empty, 13, "y", Red, Empty))
let test3 = rb_tree3 = Node (Node (Empty, 10, "x", Black, Empty),
			     13, "y", Black,
			     Node (Empty, 15, "z", Black, Empty))