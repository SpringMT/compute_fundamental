(* 目的 : 0から 受け取った自然数までの二乗の和を求める *)
(* sum_of_square int -> int *)

let rec sum_of_square n =
  if n = 0 then 0
         else n * n + sum_of_square (n - 1)

(* test *)
let test1 = sum_of_square 0 = 0
let test1 = sum_of_square 3 = 14
let test1 = sum_of_square 4 = 30
