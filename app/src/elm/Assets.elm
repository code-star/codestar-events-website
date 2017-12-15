module Elm.Assets exposing (..)

type AssetPath = AssetPath String

logo = AssetPath "codestar-logo-notext.svg"

path : AssetPath -> String
path (AssetPath str) = str
