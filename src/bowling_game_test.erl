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

one_spare_test() ->
    G = bowling_game:new(),
    G2 = bowling_game:roll(G, 5),
    G3 = bowling_game:roll(G2, 5),
    G4 = bowling_game:roll(G3, 3),
    G5 = roll_many(G4, 17, 0),
    ?assertEqual(16, bowling_game:score(G5)).

one_strike_test() ->
    G = bowling_game:new(),
    G2 = bowling_game:roll(G, 10),
    G3 = bowling_game:roll(G2, 3),
    G4 = bowling_game:roll(G3, 4),
    G5 = roll_many(G4, 16, 0),
    ?assertEqual(24, bowling_game:score(G5)).

perfect_game_test() ->
    G = bowling_game:new(),
    G2 = roll_many(G, 12, 10),
    ?assertEqual(300, bowling_game:score(G2)).

roll_many(Game, N, Pins) ->
    PinList = lists:duplicate(N, Pins),
    lists:foldl(fun(P, G) -> bowling_game:roll(G, P) end, Game, PinList).
