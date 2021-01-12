(* 目的 : 駅名と駅名と距離の組のリストを受け取ったら、その駅までの距離をかえす *)
(* assoc : string -> (string * float)list -> float *)
let rec assoc target lst = match lst with
  [] -> raise Not_found
  | (ekimei, kyori) :: rest ->
    if ekimei = target then
      kyori
    else
      assoc target rest

(* テスト *)
(* let test1 = assoc "後楽園" [] = infinity *)
let test2 = assoc "後楽園" [("新大塚", 1.2); ("後楽園", 1.8)] = 1.8
(* let test3 = assoc "池袋" [("新大塚", 1.2); ("後楽園", 1.8)] = infinity *)
