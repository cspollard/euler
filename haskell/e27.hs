module Main where

import Data.List.Ordered (member)
import Data.List.Extras (argmax)

primeSieve (x:xs) = x : (primeSieve $ modFilt x xs)

modFilt :: Integral a => a -> ([a] -> [a])
modFilt n = filter $ \m -> m `mod` n /= 0 

primes = primeSieve [2..]

quadPrimes a b n = n*n + a*n + b

nPrimes ps a b = length $ takeWhile (flip member ps) ns
    where
        ns = map (quadPrimes a b) [0..]


main = do
    putStrLn . show $ m
    where
        ps = primes
        l = [(a, b)| a <- [-1000..1000], b <- [-1000..1000]]
        m = argmax (uncurry (nPrimes ps)) l
