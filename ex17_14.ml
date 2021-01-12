#use "ex09_10.ml" (* ekikan_t, global_ekikan_list の定義 *)
#use "ex17_11.ml" (* assoc の定義 *)
#use "ex17_13.ml" (* inserts_ekikan の定義 *)

let rec get_ekikan_kyori eki1 eki2 ekikan_tree = match ekikan_tree with
  Empty -> infinity
  | Node(t1, k, lst, t2) ->
    if eki1 < k  then
      get_ekikan_kyori eki1 eki2 t1
    else if k < eki1 then
      get_ekikan_kyori eki1 eki2 t2
    else
      assoc eki2 lst

(* テスト *)
let global_ekikan_tree = inserts_ekikan Empty global_ekikan_list
let test1 = get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_tree = 1.2
let test2 = get_ekikan_kyori "茗荷谷" "池袋" global_ekikan_tree = infinity
let test3 = get_ekikan_kyori "東京" "大手町" global_ekikan_tree = 0.6