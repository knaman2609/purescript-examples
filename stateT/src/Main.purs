module Main where

import Prelude
import Effect
import Effect.Console
import Effect.Class

import Control.Monad.State.Trans

import Data.Tuple


fn :: String -> StateT (Array String) Effect Unit
fn x = do
  put [x]
  newState <- get
  liftEffect $ logShow newState
  _ <- modify (\s -> s <> ["hello"])
  pure unit

main :: Effect Unit
main = do
  Tuple a s <- runStateT (fn "init") []
  logShow s
  pure unit
