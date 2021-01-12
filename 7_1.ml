(* 目的 合計点と平均点を返す *)
(* int -> int -> int -> int -> int -> (int, int) *)
let goukei_to_heikin kokugo sansuu eigo rika shakai = (kokugo + sansuu + eigo + rika + shakai, (kokugo + sansuu + eigo + rika + shakai) / 5)

(* テスト*)
let test1 = goukei_to_heikin 10 20 30 40 50 = (150, 30)
