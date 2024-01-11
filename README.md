# camlcards

camlcards is a framework for algorithmic, turn-based card games using the standard
deck of 54 playing cards. This library provides a framework for game setup and
a standard interface for game loops and player interactions.

## Features

- Unicode card printing

## Upcoming

- Standard [MCTS](https://en.wikipedia.org/wiki/Monte_Carlo_tree_search) interface

## Example

Arguably the simplest card game, [War](https://en.wikipedia.org/wiki/War_(card_game))
is provided as an example [here](lib/games/war.ml).

Here's an example playout:
```
==================================================
Let's play War!
==================================================
Player 1's name? Alice
Player 2's name? Bob
==================================================
Player Order
==================================================
[1] - Alice
[2] - Bob
==================================================

==================================================
Distributing cards...
==================================================
[Player 1] - Alice - Played 🃑
[Player 2] - Bob - Played 🂩
Turn 1 [Player 1 (28)] - Alice won the round!
[Player 2] - Bob - Played 🂭
[Player 1] - Alice - Played 🃃
Turn 2 [Player 2 (27)] - Bob won the round!
[Player 1] - Alice - Played 🂺
[Player 2] - Bob - Played 🂲
Turn 3 [Player 1 (28)] - Alice won the round!
[Player 2] - Bob - Played 🂥
[Player 1] - Alice - Played 🂦
Turn 4 [Player 1 (29)] - Alice won the round!
...
[Player 1] - Alice - Played 🃆
[Player 2] - Bob - Played 🂥
Turn 153 [Player 1 (52)] - Alice won the round!
[Player 2] - Bob - Played 🂾
[Player 1] - Alice - Played 🃁
Turn 154 [Player 1 (53)] - Alice won the round!
[Player 1] - Alice - Played 🂻
[Player 2] - Bob - Played 🃓
==================================================
Alice wins!
==================================================
```
