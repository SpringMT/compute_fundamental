(* 目的 a x 2  + b*x + cを返す *)
(* hanbetsushiki : float -> float -> float -> float *)

let hanbetsushiki a b c = b ** 2.0 -. 4.0 *. a *. c

(* テスト *)
let test1 = hanbetsushiki 1.0 2.0 1.0 = 0.0

(* 目的 : 二次方程式の解の個数を返す *)
(* kai_no_kosuu float -> float -> float -> int *)
let kai_no_kosuu a b c = if hanbetsushiki a b c > 0.0 then
                           2
                         else if hanbetsushiki a b c = 0.0 then
                           1
                         else
                           0

(* テスト *)
let test2 = kai_no_kosuu 1.0 2.0 1.0 = 1
let test3 = kai_no_kosuu 1.0 1.0 1.0 = 0
let test4 = kai_no_kosuu 1.0 3.0 1.0 = 2


(* 目的 : 二次方程式の解が虚数解かを判定する *)
(* kai_no_kosuu float -> float -> float -> bool *)
let kyosukai a b c = if hanbetsushiki a b c < 0.0 then
                       true
                     else
                       false
let test5 = kyosukai 1.0 2.0 1.0 = false
let test6 = kyosukai 1.0 1.0 1.0 = true
let test7 = kyosukai 1.0 3.0 1.0 = false
