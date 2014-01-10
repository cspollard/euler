module Main where

import Data.List.Ordered (member)

divisors :: Integral a => a -> [a]
divisors n = 1 : filter ((== 0) . mod n) [2..m]
    where m = n `div` 2

isAbundant :: Integral a => a -> Bool
isAbundant n = n < sum (divisors n)

abundants n = filter isAbundant [12..n]

abundSum :: Integral a => [a] -> a -> Bool
abundSum abunds n = or $ map (flip member abunds) diffs
    where diffs = map ((-) n) abunds

notAbundSummable :: Integral a => a -> [a]
notAbundSummable n = filter (not . (abundSum as)) [1..n]
    where as = abundants n

main = do
    putStrLn . show $ nas
    putStrLn . show $ sum nas
    return ()
    where nas = notAbundSummable 28123
