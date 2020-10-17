-module(bowling_game).
-export([new/0, roll/2, score/1]).

new() -> 0.

roll(Game, Pins) -> Game + Pins.

score(Game) -> Game.
