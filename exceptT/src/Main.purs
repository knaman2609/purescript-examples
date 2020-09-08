module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Effect.Class
import Control.Monad.Except.Trans
import Data.Either


fn :: ExceptT String Effect Unit
fn = do
  except (Left "error")
  -- liftEffect $ log "hello"

main :: Effect Unit
main = do
  x <- runExceptT fn
  log $ show x
