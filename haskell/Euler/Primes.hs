module Euler.Primes where

import Data.Function (fix)

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
        p = head . dropWhile (\y -> rem x y /= 0) $ primes

primeFactors :: Integral a => a -> [a]
primeFactors = fix primeHelper
