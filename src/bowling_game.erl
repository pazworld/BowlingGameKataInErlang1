-module(bowling_game).
-export([new/0, roll/2, score/1]).

new() -> ok.

roll(Game, _Pins) -> Game.

score(_Game) -> 0.
