{-# LANGUAGE MultiWayIf #-}
-- | Cycle through desktops

module Main where

import           Data.List.Split
import           System.Environment
import           System.Exit
import           System.IO
import           System.Process

main :: IO ()
main = do
  desktops <- getDesktops
  cmd <- fmap head getArgs
  if | cmd == "nextWS" -> do
         let id = head $ nextElem isActive desktops
         _ <- spawn $ "wmctrl -s " ++ id
         exitSuccess
     | cmd == "prevWS" -> do
         let id = head $ prevElem isActive desktops
         _ <- spawn $ "wmctrl -s " ++ id
         exitSuccess
     | otherwise       -> do
         exitFailure
  where
    isActive = \[_, s] -> s == "*"

nextElem :: (a -> Bool) -> [a] -> a
nextElem p l = case splitted of
                 [[], a] -> head a
                 [a, []] -> head a
                 [a, b]  -> head b
               where
                 splitted = splitWhen p l

prevElem :: (a -> Bool) -> [a] -> a
prevElem p l = case splitted of
                 [[], a] -> last a
                 [a, []] -> last a
                 [a, b]  -> last a
               where
                 splitted = splitWhen p l


getDesktops :: IO [[String]]
getDesktops = do
  desktops <- spawn "wmctrl -d"
  let ds = filter ((>0) . length) $ splitOn "\n" desktops
      ds' = map ((take 2) . words) ds
  return ds'


spawn :: String -> IO String
spawn s = do
  (_, Just pOut, _, ph) <-
    createProcess (shell s) { std_out = CreatePipe }
  exitCode <- waitForProcess ph
  case exitCode of
    ExitFailure i -> exitFailure
    ExitSuccess -> do
      hGetContents pOut

