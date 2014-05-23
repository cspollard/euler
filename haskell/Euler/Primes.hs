module Euler.Primes where

import Euler.IntTree

sieve :: Integral a => [a] -> [a]
sieve [] = []
sieve (p:ps) = p : sieve (filter ((/= 0) . (`mod` p)) ps)

primes :: Integral a => [a]
primes = sieve [2..]

-- prime factors

primeFac :: Integral a => (a -> [a]) -> a -> [a]
primeFac _ 0 = []
primeFac _ 1 = [1]
primeFac accessor x = p : accessor (x `div` p)
    where p = head . dropWhile ((/=0) . (mod x)) $ primes

primeFactorTree :: Integral a => IntTree [a]
primeFactorTree = fmap (primeFac primeFactors) naturals

primeFactors :: Integral a => a -> [a]
primeFactors = (primeFactorTree !)
