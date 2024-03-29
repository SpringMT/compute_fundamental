(* あらかじめ ex08_3.ml を読み込んでおく必要あり *)
#use "ex08_3.ml"

(* person_t list 型のデータの例 *)
let lst1 = [person1; person2; person3]
let lst2 = [person3; person2; person1]

(* 目的 : person_t listを受け取ったら最初のA型の人を返す *)
(* first_A: persont_t list -> person_t option *)
let rec first_A lst = match lst with
  [] -> None
  | ({name = n; shincho =s; taiju = t; tsuki = tu; hi = h; ketsueki = k;} as first) :: rest ->
    if k = "A" then
      Some( first )
    else
      first_A rest


(* テスト *)
let test1 = first_A [] = None
let test2 = first_A lst1 = Some (person1)
let test3 = first_A lst2 = Some (person1)
