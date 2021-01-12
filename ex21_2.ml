(* 素数を求める *)
(* sieve : int list -> int list *)
(* 自然数のリストから割り切れるものを除いていくので、対象となるリストが小さくなっていく *)

let rec enumrate n =
  if n = 0 || n = 1 then
    []
   else
     enumrate (n - 1) @ [n]

let two_to_n n =
  let rec loop i =
    if i <= n then i :: loop (i + 1) else [] in
  loop 2

(* 再帰のたびに lst の長さが小さくなっているので、いずれ [] になり停止する *)
let rec sieve lst =
  (print_int (List.length lst);
   print_newline();
   match lst with
   [] -> []
   | first :: rest ->
     first :: sieve (List.filter (fun n -> (n mod first) <> 0) rest)
  )

(* テスト *)
let test1 = sieve [2; 3; 4; 5; 6; 7; 8; 9; 10] = [2; 3; 5; 7]

let prime n = sieve (enumrate n)

(* テスト *)
let test3 = prime 10 = [2; 3; 5; 7]