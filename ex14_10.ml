let even lst = 
  (* 目的：受け取った整数が偶数かどうかを判定する *) 
  (* is_even : int -> bool *) 
  let is_even n = n mod 2 = 0 
  in List.filter is_even lst

let even1 lst = List.filter (fun n -> n mod 2 = 0) lst

(* テスト *)
let test1 = even1 [] = []
let test2 = even1 [3] = []
let test3 = even1 [2] = [2]
let test4 = even1 [2; 1; 6; 4; 7] = [2; 6; 4]
let test5 = even1 [1; 2; 6; 4; 7] = [2; 6; 4]