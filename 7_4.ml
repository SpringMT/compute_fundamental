(* 目的 : ２つのx y 座標を受け取ってその中点の座標を返す *)
(* float * float -> float * float -> float * float *)

let chuten a b = match a with
  (x1, y1) -> match b with
    (x2, y2) -> ((x1 +. x2) /.2.0, (y1 +. y2) /.2.0)

(* test *)
let test1 = chuten (1.0, 1.0) (3.0, 3.0) = (2.0, 2.0)
