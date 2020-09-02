module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Foreign.Object as FO

main :: Effect Unit
main = do
  let empty = FO.empty
  let inserted = FO.insert "a" 1 empty
  log $ show inserted
