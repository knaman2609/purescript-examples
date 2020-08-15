module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Lens
import Data.Tuple
import Data.Maybe


_name :: forall a r. Lens' { name :: a | r } a
_name = lens' \record -> Tuple record.name (\new -> record { name = new })

main :: Effect Unit
main = do
  let rec = {name : (Tuple "name" (Just "Naman"))}
  let y = view (_name <<< _2 <<< _Just) rec
  let x = set (_name <<< _2) "John" { name: (Tuple "x" "y"), age: 40 }

  log $ show $ x
