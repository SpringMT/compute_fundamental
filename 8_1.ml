(* 目的 本に関する情報を格納する型 *)
type book_t = {
  title : string;
  author : string;
  publisher : string;
  price : int;
  isbn : string;
}

let book1 = { title = "タイトル1"; author = "テスト"; publisher = "あ"; price = 1000; isbn = "12345" }

type okozukai_t = {
  name : string;
  price : int;
  place : string;
  date : string;
}

let okozukai1 = {
  name = "test";
  price = 1000;
  place = "test";
  date = "2020/10/12"
}
