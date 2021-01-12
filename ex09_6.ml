(* 目的 文字列のリストを受け取ったら中の要素を前から順に結合した文字列を返す *)
(* concat : string list -> string *)
let rec concat lst = match lst with
  [] -> ""
  | first :: rest -> first ^ concat rest

(* test *)
let test1 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
let test2 = concat [] = ""
