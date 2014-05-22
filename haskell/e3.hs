import Euler.Primes

main :: IO ()
main = print . maximum . primeFactors $ 600851475143
