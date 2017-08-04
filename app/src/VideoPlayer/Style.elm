module VideoPlayer.Style exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (..)
import VideoPlayer.Types exposing (VideoItem)

videoPlayerStyle : Attribute msg
videoPlayerStyle =
    style
        [ ( "height", "500px" )
        , ( "width", "900px" )
        , ( "fontFamily", "Arial, Helvetica, sans-serif" )
        ]


videoPlayerVideoStyle : Attribute msg
videoPlayerVideoStyle =
    style
        [ ( "backgroundColor", "#000" )
        , ( "height", "100%" )
        , ( "width", "60%" )
        , ( "float", "left" )
        , ( "overflow", "hidden" )
        , ( "color", "#fff" )
        ]


videoPlayerVideoIframeStyle : Attribute msg
videoPlayerVideoIframeStyle =
    style
        [ ( "height", "100%" )
        , ( "width", "100%" )
        ]


videoPlayerListStyle : Attribute msg
videoPlayerListStyle =
    style
        [ ( "backgroundColor", "#232323" )
        , ( "height", "100%" )
        , ( "width", "40%" )
        , ( "float", "right" )
        , ( "overflow", "hidden" )
        ]


videoPlayerListItemStyle : Attribute msg
videoPlayerListItemStyle =
    style
        [ ( "height", "70px" )
        , ( "width", "100%" )
        , ( "borderBottom", "1px solid #393939" )
        , ( "padding", "15px" )
        , ( "color", "#ddd" )
        , ( "boxSizing", "border-box" )
        , ( "whiteSpace", "nowrap" )
        , ( "cursor", "pointer" )
        ]



-- use a function to return a selected style or nothing


videoPlayerListItemSelectedStyle : VideoItem -> Attribute msg
videoPlayerListItemSelectedStyle v =
    if v.selected then
        style
            [ ( "backgroundColor", "rgb(238,129,0)" ) ]
    else
        style []


videoPlayerListItemTitleStyle : Attribute msg
videoPlayerListItemTitleStyle =
    style
        [ ( "color", "#fff" )
        , ( "fontSize", "14px" )
        , ( "overflow", "hidden" )
        , ( "marginBottom", "10px" )
        ]


videoPlayerListItemDescriptionStyle : Attribute msg
videoPlayerListItemDescriptionStyle =
    style
        [ ( "fontSize", "11px" )
        , ( "overflow", "hidden" )
        ]
