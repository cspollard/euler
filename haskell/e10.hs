import Euler.Primes (primes)

main :: IO ()
main = do
    putStrLn "Find the sum of all primes below:"

    x <- return . read =<< getLine :: IO Int

    print . foldr (+) 0 . takeWhile (< x) $ (primes :: [Int])
