module View.Types where
import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Foreign.Generic (defaultOptions, genericEncodeJSON, genericDecodeJSON)
import Control.Monad.Except.Trans
import Control.Monad.Except

type Address = {
    street::  Int,
	locality:: String,
	pincode:: Int	
}


newtype User = User {
	name:: String,
	age:: Int,
	address:: Address
}
derive instance genericMyRecord :: Generic User _
instance showMyRecord :: Show User where show = genericShow