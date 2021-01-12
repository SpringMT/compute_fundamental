(* 八百屋においてある野菜と値段のリストの例 *)
let yaoya_list = [("トマト", 300); ("たまねぎ", 200);
                  ("にんじん", 150); ("ほうれん草", 200)]

(* 目的：item の値段を調べる *)
(* price : string -> (string * int) list -> int option *)
let rec price item yaoya_list = match yaoya_list with
    [] -> None
  | (yasai, nedan) :: rest ->
      if item = yasai then Some (nedan)
                      else price item rest

(* テスト *)
let test1 = price "トマト" yaoya_list = Some (300)
let test2 = price "じゃがいも" yaoya_list = None


(* 八百屋においてある野菜と値段のリストの例 *)
let yaoya_list = [("トマト", 300); ("たまねぎ", 200);
		  ("にんじん", 150); ("ほうれん草", 200)]


let rec count_urikire_yasai yasai_list yaoya_list = match yasai_list with
  [] -> 0
  | first :: rest ->
    match price first yaoya_list  with
      None -> 1 + count_urikire_yasai rest yaoya_list
      | Some(n) -> count_urikire_yasai rest yaoya_list


(* テスト *)
let test1 = count_urikire_yasai ["たまねぎ"; "にんじん"] yaoya_list = 0
let test2 = count_urikire_yasai ["たまねぎ"; "じゃがいも"; "にんじん"] yaoya_list = 1
let test3 = count_urikire_yasai ["しいたけ"; "なす"; "にんじん"] yaoya_list = 2