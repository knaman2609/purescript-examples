module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Either
import Data.Maybe
import Data.Array

newtype Validation  e r  = Validation (Either e r)
derive instance validationFunctor :: Functor (Validation e)

instance showValidation :: (Show e, Show r) => Show (Validation e r) where
  show (Validation (Left x)) = "(Validation Left " <> show x <> ")"
  show (Validation (Right y)) = "(Validation Right " <> show y <> ")"

instance applyValidation :: (Semigroup m) => Apply (Validation m) where
  apply (Validation (Left x)) (Validation (Left y)) =  Validation (Left $  x <> y)
  apply (Validation (Left x)) (Validation (Right y)) =  Validation (Left x)
  apply (Validation (Right f)) r =  f <$> r



withError :: forall a e. Maybe a  -> e -> Validation e  a
withError Nothing  err = Validation (Left err)
withError (Just a) _   = Validation (Right a)

fullName :: String -> String -> String -> String
fullName first middle last = last <> ", " <> first <> " " <> middle

fullNameEither :: Maybe String -> Maybe String -> Maybe String -> Validation (Array String) String
fullNameEither first middle last =
  map fullName (withError first ["first name error"])
  <*> (withError middle  ["middle name error"])
  <*> ( withError last ["last name error"])

main :: Effect Unit
main = do
  let x = fullNameEither  (Nothing) (Just "Naman") (Nothing)
  log $ show x
