open Camlcards.Game_setup
open Camlcards.Card

let win_condition (player : player) (players : player list) _ =
  let nonzero = List.find_all (fun (_, _, h) -> List.length h <> 0) players in
  List.length nonzero = 1 && player = List.hd players

let play_area = ref []

let turn = ref 0

let play_card : player -> player = function
  | i, n, h ->
      let card = List.hd h in
      print_endline
        (Printf.sprintf "[Player %d] - %s - Played %s" i n (string_of_card card)) ;
      play_area := card :: !play_area ;
      (i, n, List.tl h)

let card_value c =
  match snd c with Ace -> 15 | _ -> _internal_int_of_value (snd c)

let player_gets_cards player cards =
  match player with i, n, h -> (i, n, h @ cards)

let index_of item lst =
  let rec aux index = function
    | [] ->
        failwith "Element not found"
    | hd :: tl ->
        if player_id hd = player_id item then index else aux (index + 1) tl
  in
  aux 0 lst

let next_player player players =
  List.nth players
    (match index_of player players with 0 -> 1 | 1 -> 0 | _ -> 0)

let update_player (player : player) (players : player list) =
  List.map
    (fun (i, n, h) -> if i <> player_id player then (i, n, h) else player)
    players

let rec game_loop (player : player) (players : player list) =
  if win_condition player players () then player
  else
    match !play_area with
    | [c2; c1] ->
        turn := !turn + 1 ;
        let winner =
          player_gets_cards
            (List.nth
               (if !turn mod 2 <> 0 then players else List.rev players)
               ((if card_value c1 >= card_value c2 then 0 else 1) mod 2) )
            [c2; c1]
        in
        ( match winner with
        | i, n, h ->
            print_endline
              (Printf.sprintf "Turn %d [Player %d (%d)] - %s won the round!"
                 !turn i (List.length h) n ) ) ;
        (* wait () ; *)
        let players = update_player winner players in
        play_area := [] ;
        game_loop (next_player player players) players
    | _ ->
        let player = play_card player in
        let players = update_player player players in
        game_loop (next_player player players) players

let war_setup =
  { name= "War"
  ; players= 2
  ; order= Random
  ; start_hand= DistributeDeck
  ; can_see_hand= false
  ; win_condition
  ; deck_type= All54
  ; game_loop }
