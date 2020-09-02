module Main where

import Prelude
import Effect
import Effect.Console
import Effect.Class

import Control.Monad.State.Trans

import Data.Tuple


fn :: String -> StateT (String) (Effect  Unit)
fn x = do
  put [x]
  newState <- get
  liftEffect $ logShow newState
  modify (\s -> append s ["bar"])

main :: Effect Unit
main = do
  Tuple a s <- runStateT (fn "init") []
  logShow s
  pure unit
