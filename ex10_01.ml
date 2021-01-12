(* insertion sort の実装 予め昇順にならんでいる整数リストに整数 nを昇順を保ったまま挿入する *)
(* insert int list -> int -> int list *)
let rec insert lst n = match lst with
  [] -> [n]
  | first :: rest -> if first < n then
                       first :: insert rest n
                     else
                       n :: lst

(* test *)
let test1 = insert [1;3;4;7;8] 5 =  [1;3;4;5;7;8]
let test2 = insert [] 5 =  [5]
