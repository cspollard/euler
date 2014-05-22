module Euler.Divisor where

import Prelude hiding (lcm, gcd)

isDivisorOf :: Integral a => a -> a -> Bool
isDivisorOf n m = mod m n == 0

gcd :: Integral a => a -> a -> a
gcd x 0 = x
gcd x y = if x > y
            then gcd y (mod x y)
            else gcd y x

lcm :: Integral a => a -> a -> a
lcm x y = (x*y) `div` gcd x y
