pythTriplet :: Integral a => a -> a -> a -> Bool
pythTriplet a b c = (a^2) + (b^2) == (c^2)

main :: IO ()
main = do
    let trips = [a * b * (1000 - a - b) | a <- [1..333], b <- [a..(((1000-a) `div` 2) + 1)], pythTriplet a b (1000 - a - b)]

    print . head $ trips 
