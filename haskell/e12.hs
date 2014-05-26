import Euler.Divisor

triangles :: Integral a => [a]
triangles = scanl (+) 0 [1..]

main :: IO ()
main = do
    putStrLn "Find the first triangle number with at least this many divisors:"
    nDiv <- return . read =<< getLine :: IO Int
    print . head . filter ((> nDiv) . length . allDivisors) $ (triangles :: [Int])
    return ()
