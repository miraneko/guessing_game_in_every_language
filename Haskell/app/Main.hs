module Main where

import System.IO (hFlush, stdout)
import System.Random (newStdGen, randomR)

main :: IO ()
main =
  do
    gen <- newStdGen
    let (n, _) = randomR (1, 100) gen
    putStrLn "You should guess the number in range 1 .. 100"
    gameLoop n 1
  where
    gameLoop :: Integer -> Integer -> IO ()
    gameLoop n step = do
      putStr "Enter your guess: "
      hFlush stdout
      guess <- readLn
      case compare guess n of
        LT -> do
          putStrLn "Your guess is too low :("
          gameLoop n $ step + 1
        GT -> do
          putStrLn "Your guess is too high :("
          gameLoop n $ step + 1
        EQ -> putStrLn $ "You won in " ++ show step ++ " steps!"
