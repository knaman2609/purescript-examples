module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Either
import Data.Maybe
import Data.Array

newtype Validation  r  = Validation (Either (Array String) r)
derive instance validationFunctor :: Functor Validation

-- instance validationShow :: Show (Validation m) where
--   show (Validation x) = show x

instance applyValidation :: Apply (Validation) where
  apply (Validation (Left x)) (Validation (Left y)) =  Validation (Left $  (x <>  y))
  apply (Validation (Left x)) (Validation (Right y)) =  Validation (Left x)
  apply (Validation (Right f)) r =  f <$> r



withError :: forall a. Maybe a  -> Array String -> Validation  a
withError Nothing  err = Validation (Left err)
withError (Just a) _   = Validation (Right a)

fullName :: String -> String -> String -> String
fullName first middle last = last <> ", " <> first <> " " <> middle

fullNameEither :: Maybe String -> Maybe String -> Maybe String -> Validation String
fullNameEither first middle last =
  map fullName (withError first ["fname missing"])
  <*> (withError middle  ["Middle name was missing"])
  <*> ( withError last ["Last name was missing"])

main :: Effect Unit
main = do
  let x = fullNameEither  (Nothing) (Just "Naman") (Nothing)

  -- log $ show x
  case x of
    Validation (Right r) -> log $ show r
    Validation (Left e) -> log $ show e
