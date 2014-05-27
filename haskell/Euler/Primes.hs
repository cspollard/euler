module Euler.Primes where

import Data.List.Ordered (minus)
import Data.MemoTrie (HasTrie, memo)

primes :: Integral a => [a]
primes = sieve [2..] 4 primes
    where
        sieve :: Integral a => [a] -> a -> [a] -> [a]
        sieve [] _ _ = []
        sieve (x:xs) q pps@ ~(p:ps)
            | x < q = x : sieve xs q pps
            | otherwise = sieve (xs `minus` map (*p) [p+1..]) (head ps ^ 2) ps

-- prime factors

primeFactors :: (HasTrie a, Integral a) => a -> [a]
primeFactors = memo $ primeFactors' primes

primeFactors' :: Integral a => [a] -> a -> [a]
primeFactors' _ 0 = []
primeFactors' _ 1 = []
primeFactors' [] n = [n]
primeFactors' (p:ps) n
    | p*p > n = [n]
    | n `rem` p == 0 = p : primeFactors' (p:ps) (n `div` p)
    | otherwise = primeFactors' ps n
