#use "sect08_6/hyouka.ml"

(* 学生のデータの例 *)
let gakusei1 = {namae="nakamura"; tensuu=90; seiseki="A"} 
let gakusei2 = {namae="miyahara"; tensuu=80; seiseki="A"} 
let gakusei3 = {namae="sato"; tensuu=75; seiseki="B"} 
let gakusei4 = {namae="idehara"; tensuu=70; seiseki="B"} 
let gakusei5 = {namae="tsubata"; tensuu=65; seiseki="C"} 
let gakusei6 = {namae="asai"; tensuu=60; seiseki="C"} 

(* 学生のリストの例 *)
let lst1 = []
let lst2 = [gakusei2]
let lst3 = [gakusei3; gakusei4]
let lst4 = [gakusei4; gakusei3]
let lst5 = [gakusei4; gakusei1; gakusei6; gakusei5; gakusei2; gakusei3]

(* 目的 : gakusei_t型のnを受け取ったらtensuuフィールドが昇順となる位置に gakusei_t型リストに挿入する *)
let rec gakusei_ins lst g = match g with
  {namae = n0; tensuu = t0; seiseki= s0} -> match lst with
    [] -> [g]
    | ({namae = n; tensuu = t; seiseki= s} as first ) :: rest ->
        if t < t0 then
          (* 挿入skip *)
          first :: gakusei_ins rest g
        else
          (* 挿入 *)
          g :: lst

(* test *)
let test11 = gakusei_ins lst1 gakusei1 = [gakusei1]
let test12 = gakusei_ins lst2 gakusei1 = [gakusei2; gakusei1]
let test13 = gakusei_ins lst3 gakusei1 = [gakusei3; gakusei4; gakusei1]

(* 目的 : gakusei_t型のリストを受け取ったらtensuuフィールドの順に整列したリストを返す *)
(* gakusei_sort : gakusei_t list -> gakusei_t list *)
let rec gakusei_ins_sort lst = match lst with
  [] -> []
  | first :: rest -> gakusei_ins (gakusei_ins_sort rest) first

(* test *)
let test5 = gakusei_ins_sort lst1 = [] 
let test6 = gakusei_ins_sort lst2 = [gakusei2] 
let test7 = gakusei_ins_sort lst3 = [gakusei4; gakusei3] 
let test8 = gakusei_ins_sort lst4 = [gakusei4; gakusei3] 
let test9 = gakusei_ins_sort lst5 
	    = [gakusei6; gakusei5; gakusei4; gakusei3; gakusei2; gakusei1] 
