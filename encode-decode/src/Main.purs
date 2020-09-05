module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Foreign.Generic (defaultOptions, genericEncodeJSON, genericDecodeJSON)
import Control.Monad.Except.Trans
import  Control.Monad.Except


foreign import getRecord :: Effect String


newtype MyRecord = MyRecord { a :: Int }
derive instance genericMyRecord :: Generic MyRecord _
instance showMyRecord :: Show MyRecord where show = genericShow

opts = defaultOptions { unwrapSingleConstructors = true }

decode json = genericDecodeJSON opts json :: _ MyRecord

main :: Effect Unit
main = do
  let x = genericEncodeJSON opts (MyRecord { a: 1 })
  log x

  json <- getRecord

  log json

  let y = runExcept $ decode json
  log $ show y
