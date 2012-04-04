import Data.Maybe

import Data.Map (Map)
import qualified Data.Map as Map
import Data.List (foldl')

collatzMax :: (Map Int Int) -> (Int, Int)
collatzMax mp = foldl' (\(i,n) (j,m) -> if n > m then (i,n) else (j,m)) (0,0) $ Map.toList mp

collatzFind :: Int -> [Int] -> (Map Int Int) -> (Map Int Int)
collatzFind i l m
    | isJust w = foldl' (\m' (x,y) -> Map.insert x (fromJust w + y) m') m $ zip l [1,2..]
    | otherwise = if even i then collatzFind (div i 2) (i:l) m else collatzFind (3*i+1) (i:l) m
    where w = Map.lookup i m

collatzMap n = foldl' (\m' i -> collatzFind i [] m') (Map.singleton 1 1) [1..n]

main = putStrLn $ show $ collatzMax $ collatzMap 999999
