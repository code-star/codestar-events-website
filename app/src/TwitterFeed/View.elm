module TwitterFeed.View exposing (..)

import Html exposing (Attribute, Html, br, div, iframe, input, program, section, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import TwitterFeed.State exposing (..)
import TwitterFeed.Style exposing (..)
import TwitterFeed.Types exposing (..)


renderTweet : Tweet -> Html Msg
renderTweet v =
    div
        [ class "twitter-feed-item"
        , twitterFeedStyle
        ]
        [ div
            [ class "twitter-feed-item-title"
            ]
            [ text v.title
            ]
        , div
            [ class "twitter-feed-item-text"
            ]
            [ text v.text
            ]
        ]


renderTweets : List Tweet -> Html Msg
renderTweets tweet =
    div [] (List.map renderTweet tweet)


sliceText : String -> Int -> String
sliceText text limit =
    if String.length text > limit then
        String.slice 0 limit text ++ "..."
    else
        text


view : Model -> Html Msg
view model =
    div [ class "twitter-feed" ]
        [ div [ class "tweet-list" ]
            [ renderTweets model.tweets ]
        , div [ feedErrorStyle ]
            [ text model.message
            , br [][]
            , br [][]
            , text model.authToken
            ]
        ]
