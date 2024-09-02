:{
  {-# LANGUAGE DuplicateRecordFields, FlexibleInstances, UndecidableInstances #-}

  module Main where

  import Control.Monad
  import Data.Array
  import Data.Bits
  import Data.List
  import Data.Set
  import Data.Text hiding (head)
  import Debug.Trace
  import System.Environment
  import System.IO
  import System.IO.Unsafe

  miniMaxSum :: [Int] -> IO ()
  miniMaxSum arr = do
      putStrLn $ smallestItem <> " " <> biggestItem
      where
        mkL index = sum $ Data.List.map (\i -> arr !! i) (Data.List.filter (/= index) [0..4])
        ls = sort $ [ mkL i | (i,x) <- Data.List.zip [0..] arr ] 
        smallestItem = show $ Prelude.head ls
        biggestItem = show . Prelude.head . Prelude.reverse $ ls
:}
