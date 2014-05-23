import Euler.Divisor
import Control.Arrow ((&&&))

main :: IO ()
main = do
    -- print . map (id &&& (length . allDivisors)) $ ([1..] :: [Int])
    print . head . filter ((> 500) . length . allDivisors) $ ([1..] :: [Int])
    return ()
