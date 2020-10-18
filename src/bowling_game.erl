-module(bowling_game).
-export([new/0, roll/2, score/1]).

new() -> [].

roll(Game, Pins) -> [Pins | Game].

score(Game) ->
    Rolls = lists:reverse(Game),
    F = fun(_Frame, {FrameIndex, Sum}) ->
        Pin1 = lists:nth(FrameIndex, Rolls),
        Pin2 = lists:nth(FrameIndex + 1, Rolls),
        Sum2 = Sum + Pin1 + Pin2,
        FrameIndex2 = FrameIndex + 2,
        {FrameIndex2, Sum2}
    end,
    {_, Score} = lists:foldl(F, {1, 0}, lists:seq(1, 10)),
    Score.
