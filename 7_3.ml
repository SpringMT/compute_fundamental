(* x y 座標の組を受け取って x軸について大砲な座標を返す *)
(* float * float -> float * float *)

let taisho_x zahyo = match zahyo with
  (x, y) -> (x, -.y)

(* test *)
let test1 = taisho_x (1.0, 1.0) = (1.0, -1.0)
