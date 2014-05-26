module Euler.Primes where

import Data.MemoTrie
import Data.Function (fix)
import Control.Arrow

sieve :: Integral a => [a] -> [a]
sieve [] = []
sieve (p:ps) = p : sieve (filter ((/= 0) . (`rem` p)) ps)

primes :: Integral a => [a]
primes = sieve [2..]

-- prime factors

primeHelper :: Integral a => (a -> [a]) -> a -> [a]
primeHelper _ 0 = []
primeHelper _ 1 = []
primeHelper f x = p : f (x `div` p)
    where
        p = head . dropWhile (\y -> (rem x y /= 0)) $ primes


-- currently not working: need a way to not start over at [2..] every
-- time. may have to roll back commit.
primeHelper' :: Integral a => (a -> [a] -> [a]) -> a -> [a] -> [a]
primeHelper' _ 0 _ = []
primeHelper' _ 1 _ = []
primeHelper' f x ps = p : f (x `div` p) ps'
    where
        ps' = dropWhile (\y -> (rem x y /= 0)) ps
        p = head ps'


primeFactors :: (HasTrie a, Integral a) => a -> [a]
primeFactors = memo (primeHelper primeFactors)

primeFactors' :: Integral a => a -> [a]
primeFactors' = fix primeHelper
