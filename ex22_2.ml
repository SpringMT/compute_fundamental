(* Arrayが与えられたら、そこにフィボナッチ数をじゅんに入れた配列を返す *)
(* fib_array: Array int -> Array int *)

let fib_array array =
  let n = Array.length array in
    let rec loop i =
      if i < n then
        (
          if i = 0 then
            array.(i) <- 0
          else if i = 1 then
            array.(i) <- 1
          else
            array.(i) <- array.(i-2) + array.(i-1);

          loop (i + 1)
        )
      else
        ()
    in
      (loop 0;
       array)

(* テスト *)
let test = fib_array [|0; 0; 0; 0; 0; 0; 0; 0; 0; 0|]
	   = [|0; 1; 1; 2; 3; 5; 8; 13; 21; 34|]