(* 目的 : 2つの自然数 m と nの最大公約数を求める *)
(* gcd : int -> int -> int *)

(* 自明なケース n = 0ならばmが最大公約数 *)
(* 再帰停止性 : nと mをnで割った余り の最大公約数が答え  n の値が小さくなっているので、いずれ 0 になり停止する*)

let rec gcd m n =
  if n = 0 then
    m
  else
    gcd n (m mod n)

(* テスト *)
let test1 = gcd 7 5 = 1
let test2 = gcd 30 18 = 6
let test3 = gcd 36 24 = 12