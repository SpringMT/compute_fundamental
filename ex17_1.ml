(* 目的 : 誕生年と現在の年をnengou_tの値として受け取って年齢を返す *)
(* nenrei : nengou_t -> nengout_t -> int *)

type nengou_t = Meiji of int
               | Taishou of int
               | Showa of int
               | Heisei of int

let to_seireki nengou = match nengou with
                     Meiji (n) -> n + 1867
                   | Taishou (n) -> n + 1911
                   | Showa (n) -> n + 1925
                   | Heisei (n) -> n + 1988
let nenrei tanjou genzai =
  to_seireki genzai - to_seireki tanjou

(* テスト *)
let test1 = nenrei (Showa (42)) (Heisei (18)) = 39
let test2 = nenrei (Heisei (11)) (Heisei (18)) = 7
let test3 = nenrei (Meiji (41)) (Heisei (17)) = 97