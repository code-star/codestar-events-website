module TwitterFeed.View exposing (..)

import Html exposing (Attribute, Html, br, div, iframe, input, program, section, text, img, h4, p)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import TwitterFeed.State exposing (..)
import TwitterFeed.Style exposing (..)
import TwitterFeed.Types exposing (..)


tweetImageUrl : Tweet -> String
tweetImageUrl tweet =
    case tweet.retweetImgUrl of
      Nothing ->
        tweet.imgUrl
      Just val ->
        val

tweetUser : Tweet -> String
tweetUser tweet =
    case tweet.retweetUsername of
      Nothing ->
        tweet.userName
      Just val ->
        val

renderTweet : Tweet -> Html Msg
renderTweet tweet =
    div
        [ twitterFeedStyle ]
        [ div
            [ twitterFeedImgWrapperStyle ]
            [ img
              [ src (tweetImageUrl tweet)
              , twitterFeedImgStyle
              ] []
            ]
        , div
            [  ]
            [ h4
                [ ]
                [ text (tweetUser tweet) ]
            , p
              [ tweetTimeStyle ]
              [ text tweet.createdAt ]
            , p
              [ ]
              [ text tweet.text ]
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
            [ text model.message ]
        ]
