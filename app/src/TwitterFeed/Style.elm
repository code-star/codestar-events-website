module TwitterFeed.Style exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (..)


twitterFeedStyle : Attribute msg
twitterFeedStyle =
    style
        [ ( "fontFamily", "Arial, Helvetica, sans-serif" )
        , ( "padding", "15px" )
        , ( "borderBottom", "1px solid #eee" )
        , ( "position", "relative" )
        ]


feedErrorStyle : Attribute msg
feedErrorStyle =
    style
        [ ( "fontFamily", "Arial, Helvetica, sans-serif" )
        , ( "color", "red" )
        , ( "fontWeight", "bold" )
        , ( "margin", "15px" )
        ]


twitterFeedImgWrapperStyle : Attribute msg
twitterFeedImgWrapperStyle =
    style
        [ ( "width", "48px" )
        , ( "float", "left" )
        , ( "marginRight", "10px" )
        ]


twitterFeedImgStyle : Attribute msg
twitterFeedImgStyle =
    style
        [ ( "borderRadius", "100%" )
        ]

tweetTimeStyle : Attribute msg
tweetTimeStyle =
    style
        [ ( "position", "absolute" )
        , ( "right", "15px" )
        , ( "top", "5px" )
        , ( "fontSize", "0.9em" )
        ]
