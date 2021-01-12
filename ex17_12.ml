(* あらかじめ ex09_10.ml, ex17_10.ml を読み込んでおく必要あり *)
#use "ex09_10.ml" (* ekikan_t, global_ekikan_list の定義 *)
#use "ex17_10.ml" (* ekikan_tree_t の定義 *)

(* 目的 : ekikan_tree_t 型の木と ekikan_t 型の駅間を受け取ったら、その情報を挿入した木を返す *)
(* insert_ekikan : ekikan_tree_t -> ekikan_t -> ekikan_tree_t *)

let rec insert1 tree1 kiten shuten kyori = match tree1 with
  Empty -> Node (Empty, kiten, [(shuten, kyori)], Empty)
  | Node(t1, ekimei, lst, t2) ->
    if kiten < ekimei then
      Node( (insert1 t1 kiten shuten kyori), ekimei, lst, t2)
    else if ekimei < kiten then
      Node(t1, ekimei, lst, (insert1 t2 kiten shuten kyori))
    else
      Node(t1, ekimei, (shuten, kyori) :: lst, t2)

let insert_ekikan ekikan_tree ekikan = match ekikan with
  {kiten = k; shuten=s; keiyu = y; kyori = r; jikan = j} ->
    insert1 (insert1 ekikan_tree s k r) k s r

(* 駅間の例 *)
let ekikan1 =
  {kiten="池袋"; shuten="新大塚"; keiyu="丸ノ内線"; kyori=1.8; jikan=3}
let ekikan2 =
  {kiten="新大塚"; shuten="茗荷谷"; keiyu="丸ノ内線"; kyori=1.2; jikan=2}
let ekikan3 =
  {kiten="茗荷谷"; shuten="後楽園"; keiyu="丸ノ内線"; kyori=1.8; jikan=2}

(* テスト *)
let tree1 = insert_ekikan Empty ekikan1
let test1 = tree1 =
  Node (Empty, "新大塚", [("池袋", 1.8)], Node (Empty, "池袋", [("新大塚", 1.8)], Empty))
let tree2 = insert_ekikan tree1 ekikan2
let test2 = tree2 =
  Node (Empty, "新大塚", [("茗荷谷", 1.2); ("池袋", 1.8)],
	Node (Empty, "池袋", [("新大塚", 1.8)],
	      Node (Empty, "茗荷谷", [("新大塚", 1.2)], Empty)))
let tree3 = insert_ekikan tree2 ekikan3
let test3 = tree3 =
  Node (Node (Empty, "後楽園", [("茗荷谷", 1.8)], Empty),
	"新大塚", [("茗荷谷", 1.2); ("池袋", 1.8)],
        Node (Empty,
	      "池袋", [("新大塚", 1.8)],
	      Node (Empty,
		    "茗荷谷", [("後楽園", 1.8); ("新大塚", 1.2)],
		    Empty)))