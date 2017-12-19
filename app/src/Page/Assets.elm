module Page.Assets exposing (..)


type AssetPath
    = AssetPath String


logo =
    AssetPath "../../assets/img/codestar-logo-notext.svg"


path : AssetPath -> String
path (AssetPath str) =
    str
