module Euler.Solutions.E002 where

import Euler.Fibonacci (fibonacciSequence)

e002 = sum . filter even . takeWhile (< 4000000) $ fibonacciSequence
