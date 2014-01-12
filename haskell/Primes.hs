module PrimeSieve where

import Data.Set (Set, fromList)

modFilt :: Int -> [Int] -> [Int]
modFilt n ms = filter ((/=0) . flip mod n) ms

sieve :: [Int] -> [Int]
sieve (p:ps) = p : sieve (modFilt p ps)

primes :: [Int]
primes = sieve [2..]

primeSet :: Set Int
primeSet = fromList primes
