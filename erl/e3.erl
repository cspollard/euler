-module(e3).
-export([e3/1, primes/1, pfac/1, pfac/3]).

e3(N) ->
    hd(lists:reverse(pfac(N))).

pfac(N) ->
    pfac(N, primes(erlang:trunc(math:sqrt(N))), []).

pfac(1, _, Acc) ->
    lists:reverse(Acc);
pfac(N, [], Acc) ->
    lists:reverse([N|Acc]);
pfac(N, Primes = [H|T], Acc) ->
    case N rem H of
        0 -> pfac(N div H, Primes, [H|Acc]);
        _ -> pfac(N, T, Acc)
    end.


primes(N) ->
    primes(lists:seq(2, N), []).

primes([], Acc) ->
    lists:reverse(Acc);
primes([H|T], Acc) ->
    primes(lists:filter(fun(X) -> X rem H > 0 end, T), [H|Acc]).
