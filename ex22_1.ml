(* 文字列を受け取ったらその文字列に呼ばれるごとに異なる数字をつける *)
(* gensym : string -> string *)

let i = ref (-1)
let gensym str =
  (
    i := ! i + 1;
    str ^ string_of_int !i;
  )

let test1 = gensym "a" = "a0"
let test2 = gensym "a" = "a1"
let test3 = gensym "x" = "x2"