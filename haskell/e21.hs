import qualified Data.Map as Map
import qualified Data.Maybe as Maybe

chainlen i m
    | Maybe.isJust d = (Maybe.fromJust d, m)
    | even i = let (j, n) = chainlen (div i 2) m in (j+1, Map.insert i (j+1) n)
    | i > 1 = let (j, n) = chainlen (3*i+1) m in (j+1, Map.insert i (j+1) n)
    | otherwise = (1, Map.insert 1 1 m)
    where d = Map.lookup i m

longestChain i = maximum $ map snd $ Map.toList $ foldr (\i m -> snd (chainlen i m)) Map.empty [1..i]

main = putStrLn $ show $ longestChain 999999
