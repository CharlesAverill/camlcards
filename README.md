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
[2] - Bob
[1] - Alice
==================================================

==================================================
Distributing cards...
==================================================
[Player 2] - Bob - Played 🂻
[Player 1] - Alice - Played 🃞
Turn 1 [Player 1 (28)] - Alice won the round!
[Player 1] - Alice - Played 🃘
[Player 2] - Bob - Played 🂸
Turn 2 [Player 2 (27)] - Bob won the round!
[Player 2] - Bob - Played 🂥
[Player 1] - Alice - Played 🂴
Turn 3 [Player 2 (28)] - Bob won the round!
[Player 1] - Alice - Played 🂤
[Player 2] - Bob - Played 🃛
Turn 4 [Player 1 (27)] - Alice won the round!
[Player 2] - Bob - Played 🃁
[Player 1] - Alice - Played 🃟
Turn 5 [Player 1 (28)] - Alice won the round!
[Player 1] - Alice - Played 🃑
[Player 2] - Bob - Played 🂫
Turn 6 [Player 2 (27)] - Bob won the round!
[Player 2] - Bob - Played 🃟
[Player 1] - Alice - Played 🃔
Turn 7 [Player 2 (28)] - Bob won the round!
[Player 1] - Alice - Played 🃍
[Player 2] - Bob - Played 🂹
Turn 8 [Player 2 (29)] - Bob won the round!
[Player 2] - Bob - Played 🂩
[Player 1] - Alice - Played 🂳
Turn 9 [Player 2 (30)] - Bob won the round!
[Player 1] - Alice - Played 🂪
[Player 2] - Bob - Played 🃅
Turn 10 [Player 2 (31)] - Bob won the round!
[Player 2] - Bob - Played 🃙
[Player 1] - Alice - Played 🂧
Turn 11 [Player 2 (32)] - Bob won the round!
[Player 1] - Alice - Played 🂷
[Player 2] - Bob - Played 🃓
Turn 12 [Player 2 (33)] - Bob won the round!
[Player 2] - Bob - Played 🂽
[Player 1] - Alice - Played 🃝
Turn 13 [Player 2 (34)] - Bob won the round!
[Player 1] - Alice - Played 🂺
[Player 2] - Bob - Played 🂵
Turn 14 [Player 2 (35)] - Bob won the round!
[Player 2] - Bob - Played 🂨
[Player 1] - Alice - Played 🂡
Turn 15 [Player 1 (20)] - Alice won the round!
[Player 1] - Alice - Played 🃂
[Player 2] - Bob - Played 🂣
Turn 16 [Player 1 (21)] - Alice won the round!
[Player 2] - Bob - Played 🃄
[Player 1] - Alice - Played 🂱
Turn 17 [Player 1 (22)] - Alice won the round!
[Player 1] - Alice - Played 🂾
[Player 2] - Bob - Played 🃚
Turn 18 [Player 2 (33)] - Bob won the round!
[Player 2] - Bob - Played 🃃
[Player 1] - Alice - Played 🃇
Turn 19 [Player 1 (22)] - Alice won the round!
[Player 1] - Alice - Played 🂶
[Player 2] - Bob - Played 🃆
Turn 20 [Player 2 (33)] - Bob won the round!
[Player 2] - Bob - Played 🂲
[Player 1] - Alice - Played 🃕
Turn 21 [Player 1 (22)] - Alice won the round!
[Player 1] - Alice - Played 🃗
[Player 2] - Bob - Played 🂦
Turn 22 [Player 2 (33)] - Bob won the round!
[Player 2] - Bob - Played 🂮
[Player 1] - Alice - Played 🂢
Turn 23 [Player 2 (34)] - Bob won the round!
[Player 1] - Alice - Played 🃉
[Player 2] - Bob - Played 🃖
Turn 24 [Player 2 (35)] - Bob won the round!
[Player 2] - Bob - Played 🃊
[Player 1] - Alice - Played 🃈
Turn 25 [Player 2 (36)] - Bob won the round!
[Player 1] - Alice - Played 🃋
[Player 2] - Bob - Played 🃎
Turn 26 [Player 1 (19)] - Alice won the round!
[Player 2] - Bob - Played 🂭
[Player 1] - Alice - Played 🃒
Turn 27 [Player 2 (36)] - Bob won the round!
[Player 1] - Alice - Played 🃞
[Player 2] - Bob - Played 🂸
Turn 28 [Player 2 (37)] - Bob won the round!
[Player 2] - Bob - Played 🃘
[Player 1] - Alice - Played 🂻
Turn 29 [Player 1 (18)] - Alice won the round!
[Player 1] - Alice - Played 🃛
[Player 2] - Bob - Played 🂴
Turn 30 [Player 2 (37)] - Bob won the round!
[Player 2] - Bob - Played 🂥
[Player 1] - Alice - Played 🂤
Turn 31 [Player 2 (38)] - Bob won the round!
[Player 1] - Alice - Played 🃟
[Player 2] - Bob - Played 🂫
Turn 32 [Player 2 (39)] - Bob won the round!
[Player 2] - Bob - Played 🃑
[Player 1] - Alice - Played 🃁
Turn 33 [Player 2 (40)] - Bob won the round!
[Player 1] - Alice - Played 🂡
[Player 2] - Bob - Played 🃔
Turn 34 [Player 2 (41)] - Bob won the round!
[Player 2] - Bob - Played 🃟
[Player 1] - Alice - Played 🂨
Turn 35 [Player 2 (42)] - Bob won the round!
[Player 1] - Alice - Played 🂣
[Player 2] - Bob - Played 🂹
Turn 36 [Player 1 (13)] - Alice won the round!
[Player 2] - Bob - Played 🃍
[Player 1] - Alice - Played 🃂
Turn 37 [Player 2 (42)] - Bob won the round!
[Player 1] - Alice - Played 🂱
[Player 2] - Bob - Played 🂳
Turn 38 [Player 2 (43)] - Bob won the round!
[Player 2] - Bob - Played 🂩
[Player 1] - Alice - Played 🃄
Turn 39 [Player 2 (44)] - Bob won the round!
[Player 1] - Alice - Played 🃇
[Player 2] - Bob - Played 🃅
Turn 40 [Player 2 (45)] - Bob won the round!
[Player 2] - Bob - Played 🂪
[Player 1] - Alice - Played 🃃
Turn 41 [Player 2 (46)] - Bob won the round!
[Player 1] - Alice - Played 🃕
[Player 2] - Bob - Played 🂧
Turn 42 [Player 1 (9)] - Alice won the round!
[Player 2] - Bob - Played 🃙
[Player 1] - Alice - Played 🂲
Turn 43 [Player 2 (46)] - Bob won the round!
[Player 1] - Alice - Played 🃎
[Player 2] - Bob - Played 🃓
Turn 44 [Player 2 (47)] - Bob won the round!
[Player 2] - Bob - Played 🂷
[Player 1] - Alice - Played 🃋
Turn 45 [Player 1 (8)] - Alice won the round!
[Player 1] - Alice - Played 🂻
[Player 2] - Bob - Played 🃝
Turn 46 [Player 1 (9)] - Alice won the round!
[Player 2] - Bob - Played 🂽
[Player 1] - Alice - Played 🃘
Turn 47 [Player 2 (46)] - Bob won the round!
[Player 1] - Alice - Played 🂹
[Player 2] - Bob - Played 🂵
Turn 48 [Player 2 (47)] - Bob won the round!
[Player 2] - Bob - Played 🂺
[Player 1] - Alice - Played 🂣
Turn 49 [Player 2 (48)] - Bob won the round!
[Player 1] - Alice - Played 🂧
[Player 2] - Bob - Played 🃚
Turn 50 [Player 1 (7)] - Alice won the round!
[Player 2] - Bob - Played 🂾
[Player 1] - Alice - Played 🃕
Turn 51 [Player 2 (48)] - Bob won the round!
[Player 1] - Alice - Played 🃋
[Player 2] - Bob - Played 🃆
Turn 52 [Player 2 (49)] - Bob won the round!
[Player 2] - Bob - Played 🂶
[Player 1] - Alice - Played 🂷
Turn 53 [Player 1 (6)] - Alice won the round!
[Player 1] - Alice - Played 🃝
[Player 2] - Bob - Played 🂦
Turn 54 [Player 2 (49)] - Bob won the round!
[Player 2] - Bob - Played 🃗
[Player 1] - Alice - Played 🂻
Turn 55 [Player 1 (6)] - Alice won the round!
[Player 1] - Alice - Played 🃚
[Player 2] - Bob - Played 🂢
Turn 56 [Player 2 (49)] - Bob won the round!
[Player 2] - Bob - Played 🂮
[Player 1] - Alice - Played 🂧
Turn 57 [Player 2 (50)] - Bob won the round!
[Player 1] - Alice - Played 🂷
[Player 2] - Bob - Played 🃖
Turn 58 [Player 2 (51)] - Bob won the round!
[Player 2] - Bob - Played 🃉
[Player 1] - Alice - Played 🂶
Turn 59 [Player 2 (52)] - Bob won the round!
[Player 1] - Alice - Played 🂻
[Player 2] - Bob - Played 🃈
Turn 60 [Player 2 (53)] - Bob won the round!
[Player 2] - Bob - Played 🃊
[Player 1] - Alice - Played 🃗
==================================================
Bob wins!
==================================================
```
