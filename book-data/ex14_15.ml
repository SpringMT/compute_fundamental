(* ��Ū��n ���� 1 �ޤǤΥꥹ�Ȥ��� *) 
(* enumerate : int -> int list *) 
let rec enumerate n = 
  if n = 0 then [] else n :: enumerate (n - 1) 
 
(* ��Ū��1 ���������ä������� n �ޤǤι�פ��֤� *) 
(* one_to_n : int -> int *) 
let one_to_n n = 
  List.fold_right (+) (enumerate n) 0 
 
(* �ƥ��� *) 
let test1 = one_to_n 0 = 0 
let test2 = one_to_n 1 = 1 
let test3 = one_to_n 2 = 3 
let test4 = one_to_n 10 = 55 