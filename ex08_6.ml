#use "ex08_5.ml"

let ekimei1 = {kanji="茗荷谷"; kana="みょうがだに";
       romaji="myogadani"; shozoku="丸ノ内線"}
let ekimei2 = {kanji="渋谷"; kana="しぶや";
       romaji="shibuya"; shozoku="銀座線"}
let ekimei3 = {kanji="大手町"; kana="おおてまち";
       romaji="otemachi"; shozoku="千代田線"}

(* 目的 ekimei_tを受け取って路線名 駅名 かなの形式の文字列を返す *)
(* hyoji : ekimei_t -> string *)

let hyoji ekimei = match ekimei with
  {kanji = k; kana = a; romaji = r; shozoku = s} -> s ^ ", " ^ k ^ "(" ^ a ^ ")"

let test1 = hyoji ekimei1 = "丸ノ内線, 茗荷谷(みょうがだに)"
