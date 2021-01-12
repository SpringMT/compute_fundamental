(* 目的 : 整数のリストを受け取ってリストの長さを返す *)
(* length : int list -> int *)

let rec length lst = match lst with
    [] -> 0
  | first :: rest -> 1 + length rest

let test1 = length [] = 0
let test2 = length [1] = 1
let test3 = length [2; 3; 4; 5] = 4
