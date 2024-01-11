open Card

type hand = card list

let string_of_hand = function
  | i, name, h ->
      Printf.sprintf "[Player %d] %s's hand - %d - " i name (List.length h)
      ^ List.fold_left (fun acc c -> acc ^ string_of_card c ^ " ") "" h

let print_hand p = print_endline (string_of_hand p)
