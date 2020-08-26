module Main where

import Prelude
import Data.Array
import Data.Maybe
import Effect (Effect)
import Effect.Class.Console
type Small r = {
  name :: String,
  id:: Int
  | r
}

type Big = {
  name :: String,
  id:: Int,
  location :: String,
  username :: String
}


fn :: forall r. Small r -> Effect Unit
fn x = log x.name

main = do

  let big = {
    name : "Naman",
    id: 1,
    location: "lohaghat",
    username: "knaman"
  }

  fn big
