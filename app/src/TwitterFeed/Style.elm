module TwitterFeed.Style exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (..)


feedErrorStyle : Attribute msg
feedErrorStyle =
    style
        [ ( "fontFamily", "Arial, Helvetica, sans-serif" )
        , ( "color", "red" )
        , ( "fontWeight", "bold" )
        , ( "margin", "15px" )
        ]
