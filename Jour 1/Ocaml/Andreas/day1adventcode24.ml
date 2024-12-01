let liste1 = [1; 2; 3; 4; 9] 
let liste2 = [3; 7; 5; 2; 2] 
let sum = ref 0
let sum2 = ref 0
let sorted_list1 = List.sort compare liste1 ;;
let sorted_list2 = List.sort compare liste2;; 
List.iter2 (fun x y -> 
    if x > y then 
      sum := !sum + (x - y)
    else 
      sum := !sum + (y - x);
  ) sorted_list1 sorted_list2;;

Printf.printf "Somme : %d\n" !sum;

sum := 0;;
List.iter(fun n -> 
    sum := !sum + n * List.fold_left (fun acc x -> if x = n then acc + 1 else acc) 0 liste2) liste1;;
Printf.printf "Somme : %d\n" !sum
