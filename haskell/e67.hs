{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Text as T
import System.Environment (getArgs)
import Control.Monad (liftM)
import Debug.Trace (trace)

main :: IO ()
main = do
    args <- getArgs
    content <- (liftM T.pack . readFile) (head args)
    print content
    xs <- return $ reverse $ getRows content
    print xs
    print (maxPath xs)
    -- print ((head . head) $ (addAllRows . getRows) content)

-- the second argument must always be shorter.
addPaths :: [Int] -> [Int] -> [Int]
addPaths _ [] = []
addPaths (y:y':ys) (x:xs) = (x + max y y') : addPaths (y':ys) xs

maxPath :: [[Int]] -> Int
maxPath [x] = head x
maxPath (x:x':xs) =
        trace (show ans) (maxPath ans)
    where ans = addPaths x x' : xs

getRows :: T.Text -> [[Int]]
getRows s = map (map (read . T.unpack) . T.splitOn (T.singleton ' ')) ls
    where
        ls = T.lines s
