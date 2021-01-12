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

(* ketsueki_hyoji : person_t -> string *)
let ketsueki_hyoji person = match person with
  { name = n; ketsueki = k } -> n ^ "さんの血液型は" ^ k ^ "型です"

let test1 = ketsueki_hyoji person1 = "testさんの血液型はA型です"
