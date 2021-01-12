(* 学生ひとり分のデータ（名前、点数、成績）を表す型 *)
type gakusei_t = {
  namae : string;       (* 名前 *)
  tensuu : int;         (* 点数 *)
  seiseki : string;     (* 成績 *)
}

(* gakusei_t list 型のデータの例 *)
let lst1 = []
let lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}]
let lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"};
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}]
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"};
            {namae = "asai"; tensuu = 70; seiseki = "B"};
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}]

(* 点数を追加する *)
(* gakusei_t  -> int *)
(*
let gakusei_tensuu gakusei rest = match gakusei with
  {namae = n; tensuu = t; seiseki = s} -> t +  rest
*)

(* 目的 gakusei_t型のリストを受け取って全員の得点の合計を算出する  *)
(* gakusei_sum : gakusei_t list -> int *)
(* et gakusei_sum lst = List.fold_right gakusei_tensuu lst 0 *)

let gakusei_sum lst =
 let gakusei_tensuu gakusei rest = match gakusei with
   {namae = n; tensuu = t; seiseki = s} -> t +  rest
   in List.fold_right gakusei_tensuu lst 0

(* テスト *)
let test1 = gakusei_sum lst1 = 0
let test2 = gakusei_sum lst2 = 70
let test3 = gakusei_sum lst3 = 155
let test4 = gakusei_sum lst4 = 235