open Settings
open String_utils

type suit = Joker | Club | Diamond | Heart | Spade

let suits_list = [Spade; Heart; Diamond; Club]

let string_of_suit =
  if !unicode_output then function
    | Club -> "♣" | Diamond -> "♦" | Heart -> "♥" | Spade -> "♠" | Joker -> ""
  else function
    | Club -> "C" | Diamond -> "D" | Heart -> "H" | Spade -> "S" | Joker -> ""

let _internal_int_of_suit = function
  | Club ->
      0
  | Diamond ->
      1
  | Heart ->
      2
  | Spade ->
      3
  | Joker ->
      9

type value =
  | Two
  | Three
  | Four
  | Five
  | Six
  | Seven
  | Eight
  | Nine
  | Ten
  | Jack
  | Queen
  | King
  | Ace
  | Joker

let values_list =
  [ Two
  ; Three
  ; Four
  ; Five
  ; Six
  ; Seven
  ; Eight
  ; Nine
  ; Ten
  ; Jack
  ; Queen
  ; King
  ; Ace
  ; Joker ]

let values_no_joker = List.filter (fun v -> v <> Joker) values_list

let string_of_value = function
  | Two ->
      "2"
  | Three ->
      "3"
  | Four ->
      "4"
  | Five ->
      "5"
  | Six ->
      "6"
  | Seven ->
      "7"
  | Eight ->
      "8"
  | Nine ->
      "9"
  | Ten ->
      "10"
  | Jack ->
      "J"
  | Queen ->
      "Q"
  | King ->
      "K"
  | Ace ->
      "A"
  | Joker ->
      !joker_string

let _internal_int_of_value = function
  | Ace ->
      1
  | Two ->
      2
  | Three ->
      3
  | Four ->
      4
  | Five ->
      5
  | Six ->
      6
  | Seven ->
      7
  | Eight ->
      8
  | Nine ->
      9
  | Ten ->
      10
  | Jack ->
      11
  | Queen ->
      13
  | King ->
      14
  | Joker ->
      16

type card = suit * value

let unicode_card =
  let unicode_card_base = 0x1F0A0 in
  function
  | s, v ->
      if v = Joker then string_of_unicode 0x1F0DF
      else
        let s, v = (_internal_int_of_suit s, _internal_int_of_value v) in
        string_of_unicode (unicode_card_base + (16 * s) + v)

let string_of_card =
  if !unicode_output then unicode_card
  else function
    | s, v -> (if v = Joker then "" else string_of_suit s) ^ string_of_value v

let card_back_string =
  if !unicode_output then string_of_unicode 0x1F0A0 else "#"

let print_cards_test () =
  print_endline (string_of_bool !unicode_output) ;
  let _ =
    List.map
      (fun s ->
        let _ =
          List.map
            (fun v -> print_string (string_of_card (s, v) ^ " "))
            (List.filteri
               (fun i _ -> i <> List.length values_list - 1)
               values_list )
        in
        print_endline "" )
      suits_list
  in
  print_endline (card_back_string ^ " " ^ string_of_card (Joker, Joker))
