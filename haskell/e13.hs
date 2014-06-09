import System.Environment (getArgs)

main :: IO ()
main = do
    nums <- return . map read . lines =<< readFile . head =<< getArgs :: IO [Integer]

    putStrLn . take 10 . show . sum $ nums
