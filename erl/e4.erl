-module(e4).
-export([e4/1]).

e4(N) ->
    ispal(digits(N)).

ispal(L) ->
    ispal(L, []).

ispal(L, L) ->
    true;
ispal([_|L], L) ->
    true;
ispal([H|T], L) ->
    ispal(T, [H|L]);
ispal(_, _) ->
    false.

digits(N) ->
    digits(N, []).

digits(0, Acc) ->
    Acc;
digits(N, Acc) ->
    digits(N div 10, [N rem 10|Acc]).
