module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Either
import Data.Maybe

fullName first middle last = last <> ", " <> first <> " " <> middle

main :: Effect Unit
main = do
  let x = fullName <$> Just "Phillip" <*> Just "A" <*> Just "c"
  log $ show x


  -- | ``` purescript
  -- | f <$> Nothing <*> Just y == Nothing
  -- | f <$> Just x <*> Nothing == Nothing
  -- | f <$> Nothing <*> Nothing == Nothing
  -- | ```
-- instance applyMaybe :: Apply Maybe where
--   apply (Just fn) x = fn <$> x
--   apply Nothing   _ = Nothing

-- above code evals from left to right
