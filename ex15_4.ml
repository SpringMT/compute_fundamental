(* あらかじめ ex12_1.ml を読み込んでおく必要あり *)
#use "ex12_1.ml" (* eki_t の定義 *)

(* 目的 : eki_t listを受け取って最短距離の駅と最短距離最小の駅以外からなるリストを返す *)
(* saitan_wo_bunri : eki_t list -> [eki_t, [eki_t]] *)

(* 駅の例 *)
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []}
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]}
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]}
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []}

let rec saitan_wo_bunri lst = match lst with
  [] -> ({namae = ""; saitan_kyori = infinity; temae_list = []}, [])
  | ({namae = n; saitan_kyori = s; temae_list = t } as first) :: rest ->
     let (p, v) = saitan_wo_bunri rest in
        match (first, p) with
        	({namae = fn; saitan_kyori = fs; temae_list = ft},
        	 {namae = sn; saitan_kyori = ss; temae_list = st}) ->
            if sn = "" then (first, v)
	          else if fs < ss then (first, p :: v)
	          else (p, first :: v)

(* 駅リストの例 *)
let lst = [eki1; eki2; eki3; eki4]

(* テスト *)
let test = saitan_wo_bunri lst = (eki3, [eki1; eki2; eki4])

(* [eki1; eki2; eki4] の順番は各駅の最短距離の値によって変わりうる。
   その順番をテストで予想することには意味がないので、上のようなテストを
   作るよりは、単に

   let test = saitan_wo_bunri lst

   として結果を自分で確かめる方が良いかもしれない。*)