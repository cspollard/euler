import qualified Data.Map as M
import Data.Maybe (fromJust)
import Debug.Trace

data Grid = Grid (Int, Int) (M.Map (Int, Int) Bool) deriving Show

newGrid :: Int -> Int -> Grid
newGrid m n = Grid (0, 0) $ M.fromList $ zip [(x, y) | x <- [0,1..m], y <- [0,1..n]] $ repeat False

move :: Grid -> (Int, Int) -> Grid
move g@(Grid (x0, y0) m) (x1, y1)
    | M.member (x, y) m = trace (show (x0, y0) ++ " --> " ++ show (x, y)) Grid (x, y) $ M.insert (x0, y0) True m
    | otherwise = Grid (x0, y0) $ M.insert (x0, y0) True m
    where
        x = x0 + x1
        y = y0 + y1

countPaths :: Grid -> (Int, Int) -> Int
countPaths g@(Grid (x0, y0) m) (x1, y1)
    | m M.! (x0, y0) = trace ("already visited " ++ show (x0, y0)) 0
    | x0 == x1 && y0 == y1 = 1
    | otherwise = sum $ map (flip countPaths (x1, y1)) $ map (move g) [(1,0), (0, 1), (-1, 0), (0, -1)]
