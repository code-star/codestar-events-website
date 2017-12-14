module VideoPlayer.View exposing (..)

import Html exposing (Attribute, Html, br, div, iframe, input, program, section, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import VideoPlayer.State exposing (..)
import VideoPlayer.Style exposing (..)
import VideoPlayer.Types exposing (..)


toVideoItem : VideoItem -> Html Msg
toVideoItem v =
    div
        [ class "video-list-item"
        , videoPlayerListItemStyle
        , videoPlayerListItemSelectedStyle v
        , onClick (SelectVideo v)
        ]
        [ div
            [ class "video-list-item-title"
            , videoPlayerListItemTitleStyle
            ]
            [ text v.title
            ]
        , div [ class "video-list-item-description", videoPlayerListItemDescriptionStyle ]
            [ text (sliceText v.description maxVideoDescriptionLength)
            ]
        ]


renderVideos : List VideoItem -> Html Msg
renderVideos videos =
    div [] (List.map toVideoItem videos)


renderVideo : String -> Html msg
renderVideo videoId =
    iframe
        [ src ("https://www.youtube.com/embed/" ++ videoId ++ "?controls=2&amp;showinfo=true&amp;rel=0&amp;enablejsapi=1&amp;origin=https%3A%2F%2Fwww.codestar.nl&amp;widgetid=1")
        , videoPlayerVideoIframeStyle
        ]
        []


sliceText : String -> Int -> String
sliceText text limit =
    if String.length text > limit then
        String.slice 0 limit text ++ "..."
    else
        text


view : Model -> Html Msg
view model =
    div [ class "video-player", videoPlayerStyle ]
        [ div [ class "video-container", videoPlayerVideoStyle ]
            [ renderVideo model.selectedVideoId
            ]
        , div [ class "video-list", videoPlayerListStyle ]
            [ renderVideos model.videos ]
        ]
