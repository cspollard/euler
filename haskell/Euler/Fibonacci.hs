module Euler.Fibonacci where

fibonacciSequence :: [Int]
fibonacciSequence = 0:1:zipWith (+) fibonacciSequence (tail fibonacciSequence)
