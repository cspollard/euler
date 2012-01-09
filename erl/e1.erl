-module(e1).
-export([e1/1]).

e1(N) when N =< 0 ->
    N;
e1(N) ->
    e1(N-1, 0).

e1(0, Acc) ->
    Acc;
e1(N, Acc) when N rem 3 > 0, N rem 5 > 0 ->
    e1(N-1, Acc);
e1(N, Acc) ->
    e1(N-1, Acc+N).
