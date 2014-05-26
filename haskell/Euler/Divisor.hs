module Euler.Divisor where

import Prelude hiding (lcm, gcd)
import qualified Data.MemoTrie as MT


isDivisorOf :: Integral a => a -> a -> Bool
isDivisorOf n m = rem m n == 0

divis' :: Integral a => a -> a -> a -> [a]
divis' x cur end = if cur >= end
                        then []
                        else if x `rem` cur == 0
                                then let y = x `div` cur in cur : y : divis' x (cur+1) (y-1)
                                else divis' x (cur+1) end

allDivisors :: Integral a => a -> [a]
allDivisors x = divis' x 1 x
-- allDivisors a = nub . map product . subsequences . primeFactors $ a


{-
divisorsHelp :: Integral a => (a -> Set a) -> a -> Set a
divisorsHelp _ 0 = S.empty
divisorsHelp _ 1 = S.singleton 1
divisorsHelp accessor x = accessor (x `div` p) `S.insert` x `S.insert` (x `div` p)
    where p = head . dropWhile ((/=0) . rem x) $ primes


divisors' :: Integral a => (a -> [a])
divisors' = MT.memo
-}

gcd :: Integral a => a -> a -> a
gcd x 0 = x
gcd x y = if x > y
            then gcd y (rem x y)
            else gcd y x

lcm :: Integral a => a -> a -> a
lcm x y = (x*y) `div` gcd x y
