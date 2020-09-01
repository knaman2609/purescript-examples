module Main where

import Prelude
import Effect (Effect)
import Effect.Class.Console

import Data.Generic.Rep
import Data.Generic.Rep.Show


data Foo  = Foo String
derive instance genericFoo :: Generic (Foo) _

main :: forall e. Effect  Unit
main = do
  log $ genericShow (Foo "hello")
