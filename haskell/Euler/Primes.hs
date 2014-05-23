module Euler.Primes where

import Euler.IntTree
import Data.MemoTrie

sieve :: Integral a => [a] -> [a]
sieve [] = []
sieve (p:ps) = p : sieve (filter ((/= 0) . (`mod` p)) ps)

primes :: Integral a => [a]
primes = sieve [2..]

-- prime factors

primeHelper :: Integral a => (a -> [a]) -> a -> [a]
primeHelper f x = p : f (x `div` p)
    where p = head . dropWhile ((/=0) . mod x) $ primes

primeFactors :: (HasTrie a, Integral a) => a -> [a]
primeFactors = memo (primeHelper primeFactors)
