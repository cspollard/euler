nProd :: (Num a) => [a] -> Int -> a
nProd xs n = product . take n $ xs

maxNProd :: (Ord a, Num a) => [a] -> Int -> a
maxNProd [] _ = 0
maxNProd xs n = max (nProd xs n) (maxNProd (tail xs) n)

main :: IO ()
main = do
    xs <- return . map (read . (:[])) . concat . lines =<< getContents
    -- print (xs :: [Int])
    print . maxNProd xs $ 13
