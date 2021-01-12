(* あらかじめ ex10_10.ml, ex10_11.ml を読み込んでおく必要あり *)
#use "ex10_10.ml"
#use "ex10_11.ml"

(* kyori_wo_hyoji string -> string -> string *)
let kyori_wo_hyoji eki1 eki2 =
  let eki1_kanji = romaji_to_kanji eki1 global_ekimei_list in
  if eki1_kanji = "" then
    eki1 ^ " という駅は存在しません"
  else
    let eki2_kanji = romaji_to_kanji eki2 global_ekimei_list in
      if eki2_kanji = "" then
        eki2 ^ " という駅は存在しません"
      else
        let kyori = get_ekikan_kyori eki1_kanji eki2_kanji global_ekikan_list in
          if kyori = infinity then
            eki1_kanji ^ "と" ^ eki2_kanji ^ "はつながっていません"
          else
             eki1_kanji ^ "から" ^ eki2_kanji ^ "までは " ^ string_of_float kyori ^ " キロです"




(* テスト *)
let test1 = kyori_wo_hyoji "myougadani" "shinotsuka"  = "myougadani という駅は存在しません"
let test1 = kyori_wo_hyoji "myogadani" "shinotsuka" = "茗荷谷から新大塚までは 1.2 キロです"
let test1 = kyori_wo_hyoji "myogadani" "ikebukuro" = "茗荷谷と池袋はつながっていません"
let test1 = kyori_wo_hyoji "tokyo" "ootemachi" = "ootemachi という駅は存在しません"
let test1 = kyori_wo_hyoji "tokyo" "otemachi" = "東京から大手町までは 0.6 キロです"
