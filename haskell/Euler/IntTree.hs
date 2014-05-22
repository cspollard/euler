-- take from
-- https://stackoverflow.com/questions/3208258/memoization-in-haskell

module Euler.IntTree where

-- import Prelude hiding ((!))
import Euler.Primes (primes)
import Euler.Divisor

data IntTree a = IntTree (IntTree a) a (IntTree a)

instance Functor IntTree where
    fmap f (IntTree l m r) = IntTree (fmap f l) (f m) (fmap f r)

(!) :: IntTree a -> Int -> a
(!) (IntTree _ m _) 0 = m
(!) (IntTree l _ r) n = case (n - 1) `divMod` 2 of
        (q,0) -> (!) l q
        (q,1) -> (!) r q


naturals :: IntTree Int
naturals = go 0 1
    where
        go n s = IntTree (go l s') n (go r s')
            where
                l = n + s
                r = l + s
                s' = s * 2

toList :: IntTree a -> [a]
toList t = map ((!) t) [0..]
