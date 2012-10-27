module Main where

denoms = [1, 2, 5, 10, 20, 50, 100, 200]

dot l1 l2 = foldr (+) 0 $ zipWith (*) l1 l2

sumEq s (l1, l2) = dot l1 l2 == s

nGoodCombos s = length $ filter (sumEq s) $ zip phSpace $ repeat denoms

phSpace = [[a, b, c, d, e, f, g, h] |
    a <- [0..200],
    b <- [0..100],
    c <- [0..40],
    d <- [0..20],
    e <- [0..10],
    f <- [0..4],
    g <- [0..2],
    h <- [0..1]]


main = do
    putStrLn . show $ nGoodCombos 200
    return ()
