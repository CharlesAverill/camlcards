open Game_setup
open List_utils
open Deck

let name_players n =
  let names = ref [] in
  for i = 1 to n do
    print_string (Printf.sprintf "Player %d's name? " i) ;
    names := (i, String.capitalize_ascii (read_line ())) :: !names
  done ;
  List.rev !names

let bar = String.make 50 '='

let print_bar () = print_endline bar

let print_players players =
  List.iter (fun (idx, name) -> Printf.printf "[%d] - %s\n" idx name) players

let wait () =
  print_endline "[Enter to continue]" ;
  let _ = read_line () in
  ()

let wait_error msg = print_endline msg ; wait ()

let find_player_with_idx players idx = List.find (fun (i, _) -> idx = i) players

let rec choose selections prompt =
  List.iteri (Printf.printf "[%d] - %s\n") selections ;
  print_string (prompt ^ ": ") ;
  try read_int ()
  with Failure _ ->
    wait_error "Please input a valid integer choice" ;
    choose selections prompt

let rec select_player players prompt =
  let idx = choose (List.map snd players) prompt in
  try find_player_with_idx players idx
  with Failure _ ->
    wait_error "Couldn't find that player, please input a valid player number" ;
    select_player players prompt

let order_players players = function
  | Random ->
      shuffle players
  | Age b ->
      cycle_until_first
        (select_player players
           ("Who is " ^ if b then "oldest?" else "youngest?") )
        players

let winners players play_area win_condition =
  List.filter (fun p -> win_condition p players play_area) players

let any_player_wins players play_area win_condition =
  winners players play_area win_condition <> []

let distribute_cards players (deck : deck) : start_hand -> player list =
  function
  | DistributeDeck ->
      let deck = partition (shuffle deck) (List.length players) in
      List.map (fun ((i, n), d) -> (i, n, d)) (List.combine players deck)
  | None ->
      List.map (fun (i, n) -> (i, n, [])) players

let play_game setup =
  let deck = gen_deck setup.deck_type in
  (* Game header *)
  print_bar () ;
  print_endline ("Let's play " ^ setup.name ^ "!") ;
  print_bar () ;
  (* Get player names *)
  let players = name_players setup.players in
  (* Set player order *)
  let players = order_players players setup.order in
  if setup.players > 1 then (
    print_bar () ;
    print_endline "Player Order" ;
    print_bar () ) ;
  print_players players ;
  print_bar () ;
  wait () ;
  print_bar () ;
  print_endline "Distributing cards..." ;
  print_bar () ;
  let players = distribute_cards players deck setup.start_hand in
  let winner = setup.game_loop (List.hd players) players in
  print_bar () ;
  if setup.players = 1 then print_endline "Game over"
  else print_endline (player_name winner ^ " wins!") ;
  print_bar ()
