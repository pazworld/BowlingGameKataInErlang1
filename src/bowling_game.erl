-module(bowling_game).
-export([new/0, roll/2, score/1]).

new() -> [].

roll(Game, Pins) -> [Pins | Game].

score(Game) ->
    Rolls = lists:reverse(Game),
    F = fun(_Frame, {FrameIndex, Score}) ->
        Pin1 = lists:nth(FrameIndex, Rolls),
        Pin2 = lists:nth(FrameIndex + 1, Rolls),
        IsSpare = is_spare(FrameIndex, Rolls),
        if IsSpare ->
            {FrameIndex + 2, Score + 10 + lists:nth(FrameIndex + 2, Rolls)}
        ;  Pin1 + Pin2 =/= 10 ->
            {FrameIndex + 2, Score + Pin1 + Pin2}
        end
    end,
    {_, Score} = lists:foldl(F, {1, 0}, lists:seq(1, 10)),
    Score.

is_spare(FrameIndex, Rolls) ->
    10 =:= lists:nth(FrameIndex, Rolls) + lists:nth(FrameIndex + 1, Rolls).
