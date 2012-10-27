module Main where

import Data.List (groupBy, sortBy)

longDiv divisor dividend = dividend `mod` divisor * 10

idxLongDiv :: Integral a => a -> [(a, a)]
idxLongDiv n = zip [1..] $ iterate (longDiv n) 1

t2Eq (_, x) (_, y) = x == y
t2Sort (_, x) (_, y) = if x > y then GT else LT

divGroup l = filter ((>= 2) . length) $ groupBy t2Eq $ sortBy t2Sort l

-- divNRpt ((_, 0):_) = 0
divNRpt ((n1, _):(n2, _):_) = abs $ n1 - n2

getNRpt :: Integral a => a -> a
getNRpt n = 1 + (divNRpt . head . divGroup . (take 2000) . idxLongDiv $ n)

main = do
    putStrLn . show . maximum $ map getNRpt [1..1000]
    return ()
