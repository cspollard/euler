module Fibonacci where

fibonacciSequence :: [Int]
fibonacciSequence = zipWith (+) (0:1:fibonacciSequence) (tail fibonacciSequence)
