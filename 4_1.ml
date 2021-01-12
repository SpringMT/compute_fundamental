(* 4_1 *)
let jikyu = 850
let baito_kyuyo year month = (jikyu + year * 100) * month

(* 4 2 *)
let jikoshokai name = "自己紹介" ^ name

(* 4 3 *)
let hyojun_taiju shincho = (shincho ** 2.0 ) *. 22.0

(* 4 4 *)
let bmi shincho taiju = taiju /. (shincho ** 2.0 )

