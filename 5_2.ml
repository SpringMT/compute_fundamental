(* 目的 : 時間を受け取ったら午前か午後を返す *)
(* jikan : int -> string *)
let jikan x =
  if x > 12 then
    "午後"
  else
    "午前"

(* テスト *)
let test1 = jikan 0 = "午前"
let test2 = jikan 12 = "午前"
let test3 = jikan 24 = "午後"
