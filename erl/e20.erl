-module(e20).
-export([e20/1, e20/3, facs/1]).

e20(N) ->
    e20(N, 1, 1).

e20(N, T, M) ->
    case sets:size(facs(T)) > N of
        false -> e20(N, T+M+1, M+1);
        true -> T
    end.

facs(N) ->
    L = lists:filter(fun(X) -> N rem X =:= 0 end, lists:seq(1,
            erlang:trunc(math:sqrt(N)))),
    sets:from_list(L ++ lists:map(fun(X) -> N div X end, L)).
