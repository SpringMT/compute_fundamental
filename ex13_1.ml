#use "ex08_3.ml"

(* person_t list 型のデータの例 *) 
let lst = [person1; person2; person3]

(* 目的 : person_tのリストと血液型を受け取ったらその血液型の人の数を返す *)
(* count_ketsueki : person_t list -> string -> int *)
let rec count_ketsueki lst ketsueki = match lst with
  [] -> 0
  | {name = n; shincho = s; taiju = t; tsuki = u; hi = h; ketsueki = k} :: rest -> 
      if k = ketsueki then
        1 + count_ketsueki rest ketsueki
      else
        count_ketsueki rest ketsueki

(* テスト *)
let test1 = count_ketsueki [] "A" = 0
let test2 = count_ketsueki lst "A" = 1
let test3 = count_ketsueki lst "O" = 1
let test4 = count_ketsueki lst "B" = 1
let test5 = count_ketsueki lst "AB" = 0
