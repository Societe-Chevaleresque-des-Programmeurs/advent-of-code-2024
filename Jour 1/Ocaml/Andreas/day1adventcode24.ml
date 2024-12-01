let liste1 = [1; 2; 3; 4] 
let liste2 = [3; 7; 5; 2] 
let sum = ref 0
let sorted_list1 = List.sort compare liste1 ;;
let sorted_list2 = List.sort compare liste2;; 
List.iter2 (fun x y -> 
    if x > y then 
      sum := !sum + (x - y)
    else 
      sum := !sum + (y - x);
  ) sorted_list1 sorted_list2;;

Printf.printf "Somme : %d\n" !sum;