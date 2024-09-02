:{
  {-# LANGUAGE DuplicateRecordFields, OverloadedStrings, FlexibleInstances, UndecidableInstances #-}

  module Main where

  import Control.Monad
  import Data.Array
  import Data.Bits
  import Debug.Trace
  import System.Environment
  import System.IO
  import System.IO.Unsafe
  import Prelude

  timeConversion :: String -> String
  timeConversion s = converted
    where
      hours = (read . Data.Text.unpack $ Data.Text.take 2 (Data.Text.pack s)) :: Int
      minSec = Data.Text.drop 3 . Data.Text.take 8 $ Data.Text.pack s
      isPm = (Data.Text.drop 8 . Data.Text.pack $ s) == "PM"
      convHour = if isPm then (if hours == 12 then "12" else Data.Text.pack $ show (hours + 12))
        else (
        let h' = Data.Text.pack . show $ hours in
          if hours < 10 then ("0" <> h') else (if hours == 12 then "00" else h')
        )
      converted = Data.Text.unpack $ convHour <> ":" <> minSec

:}
