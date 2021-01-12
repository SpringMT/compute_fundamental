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

(* tree_map : (int -> int) -> tree_t -> tree_t *)
let rec tree_map f tree = match tree with
  Empty -> Empty
  | Leaf(n) -> Leaf(f n)
  | Node(t1, n, t2) -> Node(tree_map f t1, f n, tree_map f t2)

(* テスト *)
let test1 = tree_map (fun x -> x) tree1 = Empty
let test2 = tree_map (fun x -> x + 1) tree2 = Leaf (4)
let test3 = tree_map (fun x -> x * 3) tree3 = Node (Empty, 12, Leaf (9))
let test4 = tree_map (fun x -> x * 2) tree4
	    = Node (Leaf (6), 10, Node (Empty, 8, Leaf (6)))