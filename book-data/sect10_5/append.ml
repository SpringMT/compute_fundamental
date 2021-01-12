(* ��Ū��lst1 �� lst2 �������ꤽ�����礷���ꥹ�Ȥ��֤� *) 
(* append : 'a list -> 'a list -> 'a list *) 
let rec append lst1 lst2 = match lst1 with 
    [] -> lst2 
  | first :: rest -> first :: append rest lst2 
 
(* �ƥ��� *) 
let test1 = append [] [] = [] 
let test2 = append [] [1; 2] = [1; 2] 
let test3 = append [1; 2] [] = [1; 2] 
let test4 = append [1; 2] [3; 4] = [1; 2; 3; 4] 
let test5 = append ["a"; "b"; "c"; "d"; "e"] ["f"; "g"] 
                 = ["a"; "b"; "c"; "d"; "e"; "f"; "g"] 