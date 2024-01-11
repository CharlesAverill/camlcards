(* Return a random permutation of l *)
let shuffle l =
  Random.self_init () ;
  let nd = List.map (fun c -> (Random.bits (), c)) l in
  let sond = List.sort compare nd in
  List.map snd sond

(* Return the list, cycled until e is its first element *)
let cycle_until_first element list =
  let _ = List.find (fun i -> element = i) list in
  let rec aux e l =
    match l with [] -> [] | hd :: tl -> if hd = e then l else aux e (tl @ [hd])
  in
  aux element list

let rec split_at n lst =
  if n = 0 then ([], lst)
  else
    match lst with
    | [] ->
        ([], [])
    | hd :: tl ->
        let prefix, suffix = split_at (n - 1) tl in
        (hd :: prefix, suffix)

let partition lst n =
  let len = List.length lst in
  let sublist_size = len / n in
  let rec aux remaining acc =
    match remaining with
    | [] ->
        List.rev acc
    | _ ->
        let current, rest = split_at sublist_size remaining in
        aux rest (current :: acc)
  in
  aux lst []
