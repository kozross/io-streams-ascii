{-# LANGUAGE DerivingVia #-}

module System.IO.Streams.Ascii.Exceptional (decodeAscii) where

import Control.Exception (Exception, throw)
import Data.ByteString (ByteString)
import System.IO.Streams (InputStream)
import qualified System.IO.Streams.Combinators as SC
import Text.Ascii (AsciiText)
import qualified Text.Ascii as AT

newtype AsciiException = InvalidChunk ByteString
  deriving (Eq) via ByteString
  deriving stock (Show)

instance Exception AsciiException

decodeAscii :: InputStream ByteString -> IO (InputStream AsciiText)
decodeAscii = SC.mapM go
  where
    go :: ByteString -> IO AsciiText
    go bs = case AT.fromByteString bs of
      Nothing -> throw . InvalidChunk $ bs
      Just at -> pure at
