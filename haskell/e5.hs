import Prelude hiding (lcm)
import Euler.Divisor (lcm)
-- import Data.List (foldr1)

main :: IO ()
main =
    print . foldr1 lcm $ [2..20]
