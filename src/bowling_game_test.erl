-module(bowling_game_test).
-include_lib("eunit/include/eunit.hrl").

gutter_game_test() ->
    G = bowling_game:new(),
    PinList = lists:duplicate(20, 0),
    G2 = lists:foldl(fun(_, Game) -> bowling_game:roll(Game, 0) end, G, PinList),
    ?assertEqual(0, bowling_game:score(G2)).

all_ones_test() ->
    G = bowling_game:new(),
    PinList = lists:duplicate(20, 1),
    G2 = lists:foldl(fun(Pins, Game) -> bowling_game:roll(Game, Pins) end, G, PinList),
    ?assertEqual(20, bowling_game:score(G2)).
