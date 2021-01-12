(* 目的 : 整数のリストを受け取ったらそれまでの数の合計からなるリストを返す *)
(* sum_list : int list -> int list *)

let sum_list lst =
  let rec sum lst total = match lst with
    [] -> []
    | first :: rest ->
      first + total :: sum rest (first + total)
   in sum lst 0

let test1 = sum_list [3;2;1;4] = [3;5;6;10]