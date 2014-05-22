module Euler.Primes where

import Euler.IntTree

isDivisorOf :: Integral a => a -> a -> Bool
isDivisorOf n m = mod m n == 0

sieve :: Integral a => [a] -> [a]
sieve [] = []
sieve (p:ps) = p : sieve (filter (not . isDivisorOf p) ps)

primes :: Integral a => [a]
primes = sieve [2..]

-- prime factors

primeFac :: Integral a => (a -> [a]) -> a -> [a]
primeFac _ 0 = []
primeFac _ 1 = [1]
primeFac accessor x = p : accessor (x `div` p)
    where p = head . dropWhile (not . flip isDivisorOf x) $ primes

primeFactorTree :: Integral a => IntTree [a]
primeFactorTree = fmap (primeFac primeFactors) naturals

primeFactors :: Integral a => a -> [a]
primeFactors = (primeFactorTree !)
