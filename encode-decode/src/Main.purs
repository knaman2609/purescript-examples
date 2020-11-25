module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Foreign.Generic (defaultOptions, genericEncodeJSON, genericDecodeJSON)
import Control.Monad.Except.Trans
import  Control.Monad.Except
import View.Types(User(..))

foreign import getRecord :: Effect String




opts = defaultOptions { unwrapSingleConstructors = true }

decode json = genericDecodeJSON opts json :: _ User

main :: Effect Unit
main = do
  let x = genericEncodeJSON opts (User { 	name: "foo", age: 21, address:{ street:  21, locality: "kormangla", pincode: 511037 } })
  log x

  json <- getRecord

  log json

  let y = runExcept $ decode json
  log $ show y
