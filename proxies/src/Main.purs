module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Type.Proxy (Proxy(..))
import Data.Symbol (class IsSymbol, SProxy)

main :: Effect Unit
main = do
  log "Hello sailor!"
