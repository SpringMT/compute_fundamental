(* 目的 : 漸化式の答え *)
(* a : int -> int *)
let rec a n =
  if n = 0 then 3
           else 2 * a(n - 1) - 1

(* test *)
let test1 = a 0 = 3
let test1 = a 1 = 5
let test1 = a 2 = 9
let test1 = a 3 = 17
