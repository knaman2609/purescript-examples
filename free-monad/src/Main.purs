module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Control.Monad.Free (Free, liftF, runFreeM)


data CommandF a
  = LogHello a
  | LogNumber Int a
  | GetRandomNumber (Int → a)

instance functorCommandF :: Functor CommandF where
  map f (LogHello a) = LogHello (f a)
  map f (LogNumber n a) = LogNumber n (f a)
  map f (GetRandomNumber g) = GetRandomNumber (f <<< g)

id :: forall a. a -> a
id a = a

type Command = Free CommandF

logHello :: Command Unit
logHello = liftF $ LogHello unit

logNumber :: Int → Command Unit
logNumber n = liftF $ LogNumber n unit

getRandomNumber :: Command Int
getRandomNumber = liftF $ GetRandomNumber id


main :: Effect Unit
main = do
  log "Hello sailor!"
