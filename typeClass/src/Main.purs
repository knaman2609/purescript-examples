module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)

data Naman a = Naman a


class Show a where
  show :: a -> String

instance showString :: Show String where
  show s = s

instance showBoolean :: Show Boolean where
  show true = "true"
  show false = "false"


instance showNaman :: Show a => Show (Naman a) where
  show (Naman x) = show x

class SayHello name param where
  sayHello :: name -> param -> String

instance sayHelloNaman :: Show a =>  SayHello (Naman a) b where
  sayHello x y = "sayHello " <> (show x)


main :: Effect Unit
main = do
  log $  sayHello (Naman "naman") "test"
