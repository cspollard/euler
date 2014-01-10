fib :: (Integral a) => [a]
fib = zipWith (+) (0:1:fib) (tail fib)

e2 = sum [x | x <- fib, even x, x < 4000000]
