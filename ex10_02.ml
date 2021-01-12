#use "ex10_01.ml"

(* 目的 : 整数のリストを昇順に整列したリストを返す *)
(* ins_sort : int lint -> int list *)
let rec ins_sort lst = match lst with
  [] -> []
  | first :: rest -> insert ( ins_sort rest ) first

(* test *)
let test3 = ins_sort [] = []
let test4 = ins_sort [0;0;0] = [0;0;0]
let test5 = ins_sort [5;3;8;1;7;4] = [1;3;4;5;7;8]

