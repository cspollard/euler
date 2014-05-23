import System.Environment
import Data.Map (Map)
import qualified Data.Map as M
import Control.Arrow

type Grid = Map Coord Int
type Coord = (Int, Int)

coords :: [[Int]] -> Grid
coords xs = M.fromList . concat $ zipWith (\i ys -> zipWith (\j y -> ((i, j), y)) [0..] ys) [0..] xs

path :: Grid -> Coord -> Int -> (Coord -> Coord) -> [Int]
path _ _ 0 _ = []
path m coord n f = M.findWithDefault 0 coord m : path m (f coord) (n-1) f

north, south, east, west :: Coord -> Coord
north = first (flip (-) 1)
south = first (+ 1)
east = second (+ 1)
west = second (flip (-) 1)

dirs :: [Coord -> Coord]
dirs = [north, south, east, west, north . east, north . west, south . east, south . west]

main :: IO ()
main = do
    grid <- return . coords . map (map read . words) . lines =<< getContents :: IO Grid

    print . maximum . map product $ [path grid coord 4 d | d <- dirs, coord <- M.keys grid]
