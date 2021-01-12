(* あらかじめ ex09_9.ml を読み込んでおく必要あり *)
#use "ex09_9.ml" (* ekimei_t, global_ekimei_list の定義 *)
#use "ex18_6.ml"
(* {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}; *)
(* 目的 : ローマ字の駅名を受け取ったら ekimei_t listからその駅の感じ表記を返す なければ "" を返す *)
(* romaji_to_kanji : string -> ekimei_t list -> string *)
let rec romaji_to_kanji ekimei lst = match lst with
  [] -> raise(No_such_station(ekimei))
  | {kanji = k; kana = ka; romaji = r; shozoku = s} :: rest ->
      if ekimei = r then
        k
      else
        romaji_to_kanji ekimei rest


(* test *)
(* let test1 = romaji_to_kanji "wakaranai" global_ekimei_list = "" *)
let test2 = romaji_to_kanji "myogadani" global_ekimei_list = "茗荷谷"
