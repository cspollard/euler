module Euler.Primes where

import Euler.Divisor (isDivisorOf)
import Euler.IntTree

sieve :: [Int] -> [Int]
sieve [] = []
sieve (p:ps) = p : sieve (filter (not . isDivisorOf p) ps)

primes :: [Int]
primes = sieve [2..]

-- prime factors
type FacMap = IntTree [Int]

primeFac :: (Int -> [Int]) -> Int -> [Int]
primeFac _ 0 = []
primeFac _ 1 = []
primeFac accessor x = p : accessor (x `div` p)
    where p = head . dropWhile (not . flip isDivisorOf x) $ primes

primeFactorTree :: IntTree [Int]
primeFactorTree = fmap (primeFac primeFactors) naturals

primeFactors :: Int -> [Int]
primeFactors = (primeFactorTree !)
