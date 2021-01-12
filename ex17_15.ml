#use "ex10_10.ml" (* romaji_to_kanji の定義 *)
#use "ex15_5.ml" (* saitan_wo_bunri の定義 *)
#use "ex17_14.ml" (* get_ekikan_kyori の定義 *)

(* ex14_12.ml を読み込むと ekimei_t 型、eki_t 型の定義が２度、読み込まれて
   しまうので make_initial_eki_list の定義を以下に直接、展開 *)

(* 目的：ekimei list から eki list を作る *)
(* make_initial_eki_list : ekimei_t list -> string -> eki_t list *)
let make_initial_eki_list ekimei_list kiten =
  List.map (fun ekimei -> match ekimei with
	     {kanji = k; kana = a; romaji = r; shozoku = s} ->
	       if k = kiten
	       then {namae = k; saitan_kyori = 0.; temae_list = [k]}
	       else {namae = k; saitan_kyori = infinity; temae_list = []})
	   ekimei_list

(* 目的：未確定の駅のリスト v を必要に応じて更新したリストを返す *)
(* koushin : eki_t -> eki_t list -> ekikan_t list -> eki_t list *)
let koushin p v ekikan_tree = match p with
  {namae = pn; saitan_kyori = ps; temae_list = pt} ->
    List.map (fun q -> match q with
	       {namae = qn; saitan_kyori = qs; temae_list = qt} ->
		 let kyori = get_ekikan_kyori pn qn ekikan_tree in
		 if kyori = infinity
		 then q
		 else if ps +. kyori < qs
		 then {namae = qn; saitan_kyori = ps +. kyori;
				   temae_list = qn :: pt}
		 else q)
	     v

(* ダイクストラアルゴリズムの実装 *)
(* dijkstra_main : eki_t list -> ekikan_t list -> eki_t list *)
(* koushinでstep 4を実現 *)
(* saitan_wo_bunri 最短距離最小の点 p を確定して、Vから pを除く *)
let rec dijkstra_main eki_list ekikan_tree = match eki_list with
  [] -> []
  | first :: rest ->
    let (saitan, nokori) = saitan_wo_bunri (first :: rest) in
      let eki_list2 = koushin saitan nokori ekikan_tree in
        saitan :: dijkstra_main eki_list2 ekikan_tree

(* 目的：受け取った eki_list から shuten のレコードを探し出す *)
(* find : string -> eki_t list -> eki_t *)
let rec find shuten eki_list = match eki_list with
    [] -> {namae = ""; saitan_kyori = infinity; temae_list = []}
  | ({namae = n; saitan_kyori = s; temae_list = t} as first) :: rest ->
      if n = shuten then first else find shuten rest

let global_ekikan_tree = inserts_ekikan Empty global_ekikan_list
(* dijkstra: string -> string -> eki_t list *)
let dijkstra romaji_kiten romaji_shuten =
  let kanji_kiten = romaji_to_kanji romaji_kiten global_ekimei_list in
  let kanji_shuten = romaji_to_kanji romaji_shuten global_ekimei_list in
  let eki_list = make_initial_eki_list global_ekimei_list kanji_kiten in
  let saitan_list = dijkstra_main eki_list global_ekikan_tree in
    find kanji_shuten saitan_list


(* 時間測定用の関数 *)
let time : (unit -> 'a) -> 'a * float =
  fun f ->
    let start = Sys.time () in
    let res   = f () in
    let end_  = Sys.time () in
    (res, end_ -. start)

(* テスト *)
let test1 =  time (fun () -> dijkstra "shibuya" "gokokuji" =
  {namae = "護国寺"; saitan_kyori = 9.8;
   temae_list =
     ["護国寺"; "江戸川橋"; "飯田橋"; "市ヶ谷"; "麹町"; "永田町";
      "青山一丁目"; "表参道"; "渋谷"]})
let test2 = time (fun() -> dijkstra "myogadani" "meguro" =
  {namae = "目黒"; saitan_kyori = 12.7000000000000028;
   temae_list =
     ["目黒"; "白金台"; "白金高輪"; "麻布十番"; "六本木一丁目"; "溜池山王";
      "永田町"; "麹町"; "市ヶ谷"; "飯田橋"; "後楽園"; "茗荷谷"]})
