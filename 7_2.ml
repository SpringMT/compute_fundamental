(* 目的 : 名前と成績の組を受け取ったら評価を返す *)
(* string * string -> string *)

let seiseki hyoka = match hyoka with
  (a, b) -> a ^ "さんの評価は" ^ b ^ "です"

(* test *)
let test1 = seiseki ("なまえ", "優") = "なまえさんの評価は優です"


