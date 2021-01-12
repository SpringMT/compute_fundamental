(* 目的 鶴と亀の数を与えられたら足の数の合計が算出できる *)
(* tsurukame_no_ashi : int -> int -> int  *)
let tsuru_no_ashi x = x * 2
let kame_no_ashi x = x * 4
let tsurukame_no_ashi tsuru kame = tsuru_no_ashi tsuru + kame_no_ashi kame

(* テスト *)
let test1 = tsurukame_no_ashi 0 0 = 0
let test2 = tsurukame_no_ashi 1 0 = 2
let test3 = tsurukame_no_ashi 0 1 = 4
let test4 = tsurukame_no_ashi 1 1 = 6

(* 目的 鶴と亀の合計数と足の数を与えられたら鶴の数を算出する *)
(* tsurukame : int -> int -> int  *)
let tsurukame count ashi = (2 * count) - (ashi / 2)

(* テスト *)
let test5 = tsurukame 2 6 = 1
let test6 = tsurukame 4 10 = 3
let test7 = tsurukame 0 0 = 0

