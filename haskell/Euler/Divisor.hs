module Euler.Divisor where

import Prelude hiding (lcm, gcd)
import Euler.Primes (primeFactors)
import Data.List (subsequences, nub)

isDivisorOf :: Integral a => a -> a -> Bool
isDivisorOf n m = mod m n == 0

divis' :: Integral a => a -> a -> a -> [a]
divis' x cur end = if cur >= end
                        then []
                        else if x `mod` cur == 0
                                then let y = x `div` cur in cur : y : divis' x (cur+1) (y-1)
                                else divis' x (cur+1) end

allDivisors :: Integral a => a -> [a]
allDivisors x = divis' x 1 x
-- allDivisors a = nub . map product . subsequences . primeFactors $ a

gcd :: Integral a => a -> a -> a
gcd x 0 = x
gcd x y = if x > y
            then gcd y (mod x y)
            else gcd y x

lcm :: Integral a => a -> a -> a
lcm x y = (x*y) `div` gcd x y
