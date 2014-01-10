module Main where

import Algebra.AbelianGroup.IntLinEq (intLinEq)

coeffs = [1, 2, 5, 10, 20, 50, 100, 200]

consts = [200]

main = do
    putStrLn . show $ intLinEq (coeffs, consts)
    return ()
