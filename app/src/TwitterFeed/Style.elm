module TwitterFeed.Style exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (..)


twitterFeedStyle : Attribute msg
twitterFeedStyle =
    style
        [ ( "fontFamily", "Arial, Helvetica, sans-serif" )
        , ( "padding", "15px" )
        , ( "borderBottom", "1px solid #eee" )
        ]

feedErrorStyle : Attribute msg
feedErrorStyle =
    style
        [ ( "fontFamily", "Arial, Helvetica, sans-serif" )
        , ( "color", "red" )
        , ( "fontWeight", "bold" )
        , ( "margin", "15px" )
        ]
