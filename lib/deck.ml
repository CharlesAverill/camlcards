open Card

type deck = card list

type deck_type = All54 | NoJokers

let rec gen_deck : deck_type -> card list = function
  | All54 ->
      List.flatten
        (List.map
           (fun s -> List.map (fun v -> (s, v)) values_no_joker)
           suits_list )
      @ [(Joker, Joker); (Joker, Joker)]
  | NoJokers ->
      List.filter (fun (_, v) -> v <> Joker) (gen_deck All54)
