(* 木を表す型 *)
type tree_t = Empty                     (* 空の木 *)
            | Leaf of int                   (* 葉 *)
            | Node of tree_t * int * tree_t (* 節 *)

(*
(* 節のみの木を表す型 *)
type tree_t = Node of tree_t * int * tree_t (* 節 *)
*)

(* 木の例 *)
let tree1 = Empty
let tree2 = Leaf (3)
let tree3 = Node (tree1, 4, tree2)
let tree4 = Node (tree2, 5, tree3)

(* 目的 : tree_t を受け取ったら nodeやleafに入っている値を全て2倍した tree_tを返す *)
(* tree_double : tree_t -> tree_t *)

let rec tree_double tree = match tree with
  Empty -> Empty
  | Leaf(n) -> Leaf( 2 * n )
  | Node (t1, n, t2) -> Node(tree_double t1, 2 * n, tree_double t2)
   (* tree_double t1 tree_double t2 *)

(* テスト *)
let test1 = tree_double tree1 = Empty
let test2 = tree_double tree2 = Leaf (6)
let test3 = tree_double tree3 = Node (Empty, 8, Leaf (6))
let test4 = tree_double tree4 = Node (Leaf (6), 10, Node (Empty, 8, Leaf (6)))