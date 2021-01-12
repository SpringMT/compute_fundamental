(* 人物を表す *)
type person_t = {
  name : string;
  shincho : float;
  taiju : float;
  tsuki : int;
  hi : int; (* 誕生日 *)
  ketsueki : string;
}

let person1 = {
  name = "test";
  shincho = 173.3;
  taiju = 65.3;
  tsuki = 11;
  hi = 20;
  ketsueki = "A";
}

let person2 = {
  name = "test";
  shincho = 173.3;
  taiju = 65.3;
  tsuki = 11;
  hi = 20;
  ketsueki = "B";
}

(* 目的 : 血液型がA型の人の数を返す *)
(* count_ketsueki_A : person_t list -> int *)
let rec count_ketsueki_A lst = match lst with
  [] -> 0
  | {name = n; shincho = s; taiju = t; tsuki = ts; hi = h; ketsueki = k} :: rest
    -> if k = "A" then
         1 + count_ketsueki_A rest
       else
         count_ketsueki_A rest

(* test *)
let test1 = count_ketsueki_A [] = 0
let test2 = count_ketsueki_A [person2] = 0
let test2 = count_ketsueki_A [person1; person2] = 1

