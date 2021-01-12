(* 目的 : 文字列の要素を受け取ったらその要素を前から順にくっつける *)
(* concat : string list -> string *)
let concat_str first rest = first ^ rest
let concat lst = List.fold_right concat_str lst ""

(* テスト *)
let test1 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"

