open Camlcards.Game_setup
open Camlcards.List_utils
open Camlcards.Play
open Camlcards.Deck
open Camlcards.Card

let player_quit = ref false

let turn = ref 0

let play_or_quit () =
  choose ["Continue Playing"; "Quit"] "What would you like to do" = 0

let deck = ref []

let discard = ref []

let empty_dealer = (0, "Dealer", [])

let dealer = ref empty_dealer

let player_gets_cards player cards =
  match player with i, n, h -> (i, n, h @ cards)

let card_value (c : card) =
  match snd c with
  | Jack | Queen | King ->
      10
  | Ace ->
      11
  | x ->
      _internal_int_of_value x

let hand_sum h = List.fold_left Int.add 0 (List.map card_value h)

let bust n = n > 21

let print_hand player uncover =
  print_endline
    ( match player with
    | i, name, h ->
        let h = if i = 0 && not uncover then [List.hd h] else h in
        Printf.sprintf "[Player %d] %s's hand - %d - " i name (hand_sum h)
        ^ List.fold_left (fun acc c -> acc ^ string_of_card c ^ " ") "" h )

let draw_cards player n =
  if List.length !deck < n then (
    deck := shuffle (!deck @ !discard) ;
    discard := [] ) ;
  let player_cards, deck' = split_at_n !deck n in
  deck := deck' ;
  player_gets_cards player player_cards

let rec game_loop (player : player) _ : player =
  if !turn = 0 then deck := shuffle (gen_deck NoJokers) ;
  let play = if !turn = 0 then true else play_or_quit () in
  if not play then (
    player_quit := true ;
    player )
  else (
    turn := !turn + 1 ;
    let player_ref = ref (draw_cards player 1) in
    dealer := draw_cards !dealer 1 ;
    player_ref := draw_cards !player_ref 1 ;
    dealer := draw_cards !dealer 1 ;
    let stand = ref false in
    while (not !stand) && hand_sum (player_hand !player_ref) <= 21 do
      print_hand !player_ref false ;
      print_hand !dealer false ;
      stand := choose ["Hit"; "Stand"] "What would you like to do" = 1 ;
      if not !stand then player_ref := draw_cards !player_ref 1
    done ;
    if hand_sum (player_hand !player_ref) > 21 then (
      print_hand !player_ref false ;
      print_endline (player_name player ^ " busted!") ) ;
    while hand_sum (player_hand !dealer) < 17 do
      dealer := draw_cards !dealer 1
    done ;
    let player_sum, dealer_sum =
      (hand_sum (player_hand !player_ref), hand_sum (player_hand !dealer))
    in
    let winner =
      if bust dealer_sum then player
      else if bust player_sum then !dealer
      else if player_sum >= dealer_sum then player
      else !dealer
    in
    print_hand !dealer true ;
    Printf.printf "[Round %d] - %s wins!\n" !turn (player_name winner) ;
    print_endline (String.make 50 '=') ;
    discard := player_hand !player_ref @ player_hand !dealer ;
    dealer := empty_dealer ;
    game_loop player [] )

let blackjack_setup =
  { name= "Blackjack"
  ; players= 1
  ; order= Random
  ; start_hand= None
  ; can_see_hand= true
  ; win_condition= (fun _ _ _ -> !player_quit)
  ; deck_type= NoJokers
  ; game_loop }
