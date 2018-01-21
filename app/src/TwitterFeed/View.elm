module TwitterFeed.View exposing (..)

--import Html.Events exposing (onClick)

import Html exposing (Attribute, Html, a, br, div, h4, iframe, img, input, p, program, section, span, text)
import Html.Attributes exposing (..)
import Page.Msg exposing (..)
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


tweetScreenname : Tweet -> String
tweetScreenname tweet =
    case tweet.retweetScreenname of
        Nothing ->
            "@" ++ tweet.screenName

        Just val ->
            "@" ++ val


tweetLink : Tweet -> String
tweetLink tweet =
    case tweet.retweetScreenname of
        Nothing ->
            "https://twitter.com/" ++ tweet.screenName ++ "/status/" ++ tweet.id

        Just val ->
            "https://twitter.com/" ++ val ++ "/status/" ++ tweet.id


renderTweet : Tweet -> Html Msg
renderTweet tweet =
    a
        [ class "social-item"
        , href (tweetLink tweet)
        ]
        [ img [ src (tweetImageUrl tweet) ] []
        , div
            []
            [ span [ class "author" ] [ text (tweetScreenname tweet) ]
            , text tweet.text
            ]
        ]



-- TODO call new Scala endpoint
-- TODO why is webpack not watching this file (or any other Elm file except Main.elm)?


isNotRetweet : Tweet -> Bool
isNotRetweet tweet =
    --    let
    --        _ =
    --            Debug.log "foo" tweet
    --    in
    if tweet.retweetUsername == Nothing then
        True
    else
        False


renderTweets : List Tweet -> Html Msg
renderTweets tweets =
    let
        tweetLimit =
            4

        tweetsAsRenderedTweets =
            List.filter isNotRetweet tweets
                |> List.take tweetLimit
                |> List.map renderTweet

        --            List.map renderTweet tweet
        --                |> List.filter isByCodestar
        --                |> List.take 5
        placeholderTweet =
            div
                [ class "social-item social-item-placeholder"
                ]
                [ div [ class "img" ] []
                , div
                    [ class "content" ]
                    [ span [ class "author" ] []
                    ]
                ]

        placeholderTweets =
            List.repeat tweetLimit placeholderTweet
    in
    div [ class "social-items" ]
        (if List.isEmpty tweetsAsRenderedTweets then
            placeholderTweets
         else
            tweetsAsRenderedTweets
        )


sliceText : String -> Int -> String
sliceText text limit =
    if String.length text > limit then
        String.slice 0 limit text ++ "..."
    else
        text


renderTweetListIfNoError : Model -> Html Msg
renderTweetListIfNoError model =
    if model.message == "" then
        div [ class "tweet-list" ]
            [ renderTweets model.tweets ]
    else
        div [] []


view : Model -> Html Msg
view model =
    let
        tweetList =
            renderTweetListIfNoError model
    in
    div [ class "twitter-feed" ]
        [ tweetList
        , div [ feedErrorStyle ]
            [ text model.message ]
        ]
