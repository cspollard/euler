module Main where

fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

nDigits 0 = 0
nDigits x = 1 + nDigits (x `div` 10)

minDigits n = (flip (>=) n) . nDigits

main = do
    putStrLn . show . length $ takeWhile (not . minDigits 3) fibs
    return ()
