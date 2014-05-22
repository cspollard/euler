module Primes where

import Divisor (isDivisorOf)
import Data.Set (Set, fromList)

sieve :: [Int] -> [Int]
sieve (p:ps) = p : sieve (filter (not . isDivisorOf p) ps)

primes :: [Int]
primes = sieve [2..]

primeSet :: Set Int
primeSet = fromList primes
