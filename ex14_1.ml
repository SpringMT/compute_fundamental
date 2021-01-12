(* 目的 整数のリストを受け取ったら偶数の要素のみを含むリストを返す *)
let even lst =
  let f n = (n mod 2 = 0) in List.filter f lst

(* テスト *)
let test1 = even [] = []
let test2 = even [1;2;3] = [2]
let test3 = even [1; 3] = []