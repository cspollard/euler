import Euler.Primes

main :: IO ()
main = do
    putStrLn "Find the maximum prime factor of:"
    print . maximum . primeFactors . read =<< getLine
