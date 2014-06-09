module Euler.Collatz where

import Data.MemoTrie (HasTrie, memo)

collatz' :: Integral a => (a -> [a]) -> a -> [a]
collatz' _ 1 = [1]
collatz' f n = n : f m
    where
        m = if odd n
                then 3*n+1
                else n `div` 2

collatz :: (HasTrie a, Integral a) => a -> [a]
collatz = memo $ collatz' collatz
