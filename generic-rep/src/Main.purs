module Main where

import Data.Generic.Rep
import Data.Generic.Rep.Show
import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

data Foo  = Foo String
derive instance genericFoo :: Generic (Foo) _

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log $ genericShow (Foo "hello")
