:{
  {-# LANGUAGE DuplicateRecordFields, FlexibleInstances, UndecidableInstances #-}

  module Main where

  import Control.Monad
  import Data.Array
  import Data.Bits
  import Data.List
  import Data.Text (stripStart, stripEnd, pack, unpack)
  import Debug.Trace
  import System.Environment
  import System.IO
  import System.IO.Unsafe

  plusMinus :: [Int] -> IO ()
  plusMinus arr = do
      putStrLn $ printRatioInArr positiveItems totalCount
      putStrLn $ printRatioInArr negativeItems totalCount
      putStrLn $ printRatioInArr zeroItems totalCount
      where
        totalCount = Data.List.length arr
        positiveItems = Data.List.length $ Data.List.filter (> 0) arr
        negativeItems = Data.List.length $ Data.List.filter (< 0) arr
        zeroItems = Data.List.length $ Data.List.filter (== 0) arr
        roundTo n x = (fromInteger $ round $ x * (10^n)) / (10.0^^n)
        printRatioInArr itemCount totalCount =
            show $ roundTo 6 $ ( (fromIntegral itemCount) / (fromIntegral totalCount))
:}
