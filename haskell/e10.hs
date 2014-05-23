import Euler.Primes (primes)

main :: IO ()
main = do
    putStrLn "Find the sum of all primes below:"

    x <- return . read =<< getLine :: IO Int

    print . sum . takeWhile (< x) $ (primes :: [Int])
