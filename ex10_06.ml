(* あらかじめ sect08_6/hyouka.ml を読み込んでおく必要あり *) 
#use "sect08_6/hyouka.ml"

(* 学生のデータの例 *) 
let gakusei1 = {namae="nakamura"; tensuu=90; seiseki="A"} 
let gakusei2 = {namae="miyahara"; tensuu=80; seiseki="A"} 
let gakusei3 = {namae="sato"; tensuu=75; seiseki="B"} 
let gakusei4 = {namae="idehara"; tensuu=70; seiseki="B"} 
let gakusei5 = {namae="tsubata"; tensuu=65; seiseki="C"} 
let gakusei6 = {namae="asai"; tensuu=60; seiseki="C"}

(* 学生のリストの例 *) 
let lst1 = [gakusei2] 
let lst2 = [gakusei3; gakusei4] 
let lst3 = [gakusei4; gakusei3] 
let lst4 = [gakusei4; gakusei1; gakusei6; gakusei5; gakusei2; gakusei3] 

let gakusei_min = {namae="min"; tensuu=min_int; seiseki="C"}
(* 目的 : gakusei_t型のリストを受け取ったら、その中から最高得点をとった人のレコードを返す *)
(* gakusei_max : gakusei_t list -> gakusei_t *)
let rec gakusei_max lst = match lst with
  [] -> gakusei_min
  | { namae = n ; tensuu = t; seiseki = s } as first :: rest ->
      let max_gakusei = gakusei_max rest in
        match max_gakusei with
          { namae = n1 ; tensuu = t1; seiseki = s1 } ->
            if t > t1 then
              first
            else
              max_gakusei


(* test *)
let test1 = gakusei_max [] = gakusei_min
let test2 = gakusei_max lst1 = gakusei2
let test3 = gakusei_max lst2 = gakusei3
let test4 = gakusei_max lst4 = gakusei1
