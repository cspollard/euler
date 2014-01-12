import Fibonacci (fibonacciSequence)

main :: IO ()
main = do 
    print $ sum [x | x <- fibonacciSequence, even x, x < 4000000]
    return ()
