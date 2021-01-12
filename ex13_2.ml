#use "ex08_3.ml"
 
(* person_t list 型のデータの例 *)
let lst = [person1; person2; person3]

(* 目的 : 名前を返す *)
let take_name person = match person with
  {name = n; shincho = s; taiju = t; tsuki = ts; hi = h; ketsueki = k} -> n
(* テスト *)
let test1 = take_name person1 = "浅井"
let test2 = take_name person2 = "宮原"
let test3 = take_name person3 = "中村"

(* 目的 : person_tのリストから人の名前のリストを返す *)
let person_name person_list = List.map take_name person_list
(* テスト *)
let test4 = person_name [] = []
let test5 = person_name lst = ["浅井"; "宮原"; "中村"]
