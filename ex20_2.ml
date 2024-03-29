#use "ex20_1.ml"
(* 目的 赤黒木の調整を行う *)
(* balance : ('a, 'b) rb_tree_t -> ('a, 'b) rb_tree_t *)
let balance tree = match tree with
    Node (Node (Node (a, xa, xb, Red, b), ya, yb, Red, c), za, zb, Black, d)
  | Node (Node (a, xa, xb, Red, Node (b, ya, yb, Red, c)), za, zb, Black, d)
  | Node (a ,xa, xb, Black, Node (Node (b, ya, yb, Red, c), za, zb, Red, d))
  | Node (a ,xa, xb, Black, Node (b, ya, yb, Red, Node (c, za, zb, Red, d)))
  -> Node (Node (a, xa, xb, Black, b), ya, yb, Red, Node (c, za, zb, Black, d))
  | _ -> tree

(* テスト *)
let rb_tree1 =
  Node (Node (Node (Empty, 10, "x", Red, Empty), 13, "y", Red, Empty),
	15, "z", Black, Empty)
let rb_tree2 =
  Node (Node (Empty, 10, "x", Red, Node (Empty, 13, "y", Red, Empty)),
	15, "z", Black, Empty)
let rb_tree3 =
  Node (Empty, 10, "x", Black,
	Node (Node (Empty, 13, "y", Red, Empty), 15, "z", Red, Empty))
let rb_tree4 =
  Node (Empty, 10, "x", Black,
	Node (Empty, 13, "y", Red, Node (Empty, 15, "z", Red, Empty)))
let rb_tree5 =
  Node (Node (Empty, 10, "x", Black, Empty), 13, "y", Red,
	Node (Empty, 15, "z", Black, Empty))
let rb_tree6 = Empty
let test1 = balance rb_tree1 = rb_tree5
let test2 = balance rb_tree2 = rb_tree5
let test3 = balance rb_tree3 = rb_tree5
let test4 = balance rb_tree4 = rb_tree5
let test5 = balance rb_tree6 = rb_tree6
