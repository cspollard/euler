import Euler.Fibonacci (fibonacciSequence)

main :: IO ()
main = do
    print . sum . filter even . takeWhile (< 4000000) $ fibonacciSequence
