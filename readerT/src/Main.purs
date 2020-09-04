module Main where

import Prelude

import Control.Monad.Reader.Trans (class MonadAsk, ReaderT(..), ask, runReaderT)
import Effect (Effect)
import Effect.Class (class MonadEffect, liftEffect)
import Effect.Console (log)

newtype Person = Person {name :: String, age :: String}


logAge :: ReaderT Person  Effect Unit
logAge = do
  Person x <- ask
  liftEffect $ log x.age

logName :: ReaderT Person  Effect Unit
logName = do
  Person x <- ask
  liftEffect $ log x.name

start :: ReaderT Person  Effect Unit
start = do
  logName
  logAge


main :: Effect Unit
main = do
  runReaderT start (Person {name: "Naman", age: "28"})

