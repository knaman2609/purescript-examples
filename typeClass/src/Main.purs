module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)

data Foo a = Foo a

data FooTest a b = FooTest a b


--- Single Parameter typeClass
class Show a where
  show :: a -> String

instance showString :: Show String where
  show s = s

instance showBoolean :: Show Boolean where
  show true = "true"
  show false = "false"


instance showFoo :: Show a => Show (Foo a) where
  show (Foo x) = show x

instance showFooTest :: (Show a , Show b) => Show (FooTest a b) where
  show (FooTest  x y) = show x <> show y


--- Multi Parameter typeClass
class SayHello name param where
  sayHello :: name -> param -> String

instance sayHelloFoo :: (Show a, Show b) => SayHello (Foo a) b where
  sayHello x y = "sayHello " <> (show x) <> (show y)

instance sayHelloFooTest :: (Show a, Show b, Show c) => SayHello (FooTest a b) c where
  sayHello x y = "sayHello " <> (show x) <> (show y)


main :: Effect Unit
main = do
  log $  sayHello (Foo "foo") "bar"
  log $  sayHello (FooTest "foo" "test") "bar"
