#use "ex12_1.ml"

let eki_list = [
{namae="池袋"; saitan_kyori = infinity; temae_list = []};
{namae="新大塚"; saitan_kyori = infinity; temae_list = []};
{namae="茗荷谷"; saitan_kyori = infinity; temae_list = []};
{namae="後楽園"; saitan_kyori = infinity; temae_list = []};
{namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []};
{namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []}
]

(* eki_tを初期化する *)
(* shokika : eki_t list -> string -> eki_list *)
let rec shokika lst namae = match lst with
  [] -> []
  | ({ namae = n; saitan_kyori = s; temae_list = t } as first) :: rest ->
      if n = namae then
        { namae = n; saitan_kyori = 0.; temae_list = [n] } :: shokika rest namae
      else
        first :: shokika rest namae

(* test *)
let test1 = shokika [] "茗荷谷" = []
let test2 = shokika eki_list "茗荷谷" = [
{namae="池袋"; saitan_kyori = infinity; temae_list = []};
{namae="新大塚"; saitan_kyori = infinity; temae_list = []};
{namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]};
{namae="後楽園"; saitan_kyori = infinity; temae_list = []};
{namae="本郷三丁目"; saitan_kyori = infinity; temae_list = []};
{namae="御茶ノ水"; saitan_kyori = infinity; temae_list = []}
]
