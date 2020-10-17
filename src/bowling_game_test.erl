-module(bowling_game_test).
-include_lib("eunit/include/eunit.hrl").

gutter_game_test() ->
    G = bowling_game:new(),
    G2 = roll_many(G, 20, 0),
    ?assertEqual(0, bowling_game:score(G2)).

all_ones_test() ->
    G = bowling_game:new(),
    G2 = roll_many(G, 20, 1),
    ?assertEqual(20, bowling_game:score(G2)).

roll_many(Game, N, Pins) ->
    PinList = lists:duplicate(N, Pins),
    lists:foldl(fun(P, G) -> bowling_game:roll(G, P) end, Game, PinList).
