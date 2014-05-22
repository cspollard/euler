module Euler.Divisor where

isDivisorOf :: Int -> Int -> Bool
isDivisorOf n m = mod m n == 0
