#use "ex10_10.ml"
#use "ex16_4.ml"
(* 目的：ekimei list から eki list を作る *)
(* make_initial_eki_list : ekimei_t list -> string -> eki_t list *)
let make_initial_eki_list ekimei_list kiten =
  List.map (fun ekimei -> match ekimei with
	     {kanji = k; kana = a; romaji = r; shozoku = s} ->
	       if k = kiten
	       then {namae = k; saitan_kyori = 0.; temae_list = [k]}
	       else {namae = k; saitan_kyori = infinity; temae_list = []})
	   ekimei_list

(* shutenを探し出す *)
let rec find shuten eki_list = match eki_list with
  [] -> {namae = ""; saitan_kyori = infinity; temae_list = []}
  | ({namae = n; saitan_kyori = s; temae_list = t} as first ) :: rest ->
    if n = shuten then
      first
    else
      find shuten rest

(* dijkstra: string -> string -> eki_t list *)
let dijkstra romaji_kiten romaji_shuten =
  let kanji_kiten = romaji_to_kanji romaji_kiten global_ekimei_list in
  let kanji_shuten = romaji_to_kanji romaji_shuten global_ekimei_list in
  let eki_list = make_initial_eki_list global_ekimei_list kanji_kiten in
  let saitan_list = dijkstra_main eki_list global_ekikan_list in
    find kanji_shuten saitan_list

(* 時間測定用の関数 *)
let time : (unit -> 'a) -> 'a * float =
  fun f ->
    let start = Sys.time () in
    let res   = f () in
    let end_  = Sys.time () in
    (res, end_ -. start)

(* テスト *)
let test1 = time (fun () -> dijkstra "shibuya" "gokokuji" =
  {namae = "護国寺"; saitan_kyori = 9.8;
   temae_list =
     ["護国寺"; "江戸川橋"; "飯田橋"; "市ヶ谷"; "麹町"; "永田町";
      "青山一丁目"; "表参道"; "渋谷"]})
let test2 = time (fun () -> dijkstra "myogadani" "meguro" =
  {namae = "目黒"; saitan_kyori = 12.7000000000000028;
   temae_list =
     ["目黒"; "白金台"; "白金高輪"; "麻布十番"; "六本木一丁目"; "溜池山王";
      "永田町"; "麹町"; "市ヶ谷"; "飯田橋"; "後楽園"; "茗荷谷"]})
