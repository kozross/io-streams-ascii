{-# LANGUAGE DerivingVia #-}

module System.IO.Streams.Ascii
  ( decodeAscii,
    encodeAscii,
  )
where

import Data.ByteString (ByteString)
import System.IO.Streams (InputStream, OutputStream)
import qualified System.IO.Streams.Combinators as SC
import Text.Ascii (AsciiText)
import qualified Text.Ascii as AT

decodeAscii :: InputStream ByteString -> IO (InputStream (Either ByteString AsciiText))
decodeAscii = SC.map go
  where
    go :: ByteString -> Either ByteString AsciiText
    go bs = case AT.fromByteString bs of
      Nothing -> Left bs
      Just at -> Right at

encodeAscii :: OutputStream ByteString -> IO (OutputStream AsciiText)
encodeAscii = SC.contramap AT.toByteString
