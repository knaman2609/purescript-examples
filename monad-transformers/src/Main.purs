module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Effect.Class
import Control.Plus

import Control.Monad.Maybe.Trans

fn :: MaybeT Effect Unit
fn  = do
  empty

main :: Effect Unit
main = do
  x <- runMaybeT fn
  log $ show x
