open Card
open Hand
open Deck

type turn_order =
  | Random
  | Age of bool (* Oldest first - true, Youngest first - false *)

type play_area = Stack of card list

type start_hand = DistributeDeck | None

type player = int * string * hand

let player_name = function _, n, _ -> n

let player_id = function i, _, _ -> i

let player_hand = function _, _, h -> h

type win_condition =
     (* Current player -> All players -> Play Area -> Current Player Wins? *)
     player
  -> player list
  -> play_area
  -> bool

type environment =
  { name: string
  ; players: int
  ; order: turn_order
  ; start_hand: start_hand
  ; can_see_hand: bool
  ; win_condition: win_condition
  ; deck_type: deck_type (* Current player, all players, winning player*)
  ; game_loop: player -> player list -> player }
