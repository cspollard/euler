module Euler.Solutions.E001 where

import Control.Applicative (liftA2)

divisibleBy :: Integral a => a -> a -> Bool
x `divisibleBy` y = (x `mod` y) == 0

e001 = sum . filter (liftA2 (||) (`divisibleBy` 3) (`divisibleBy` 5)) $ [1..999]
