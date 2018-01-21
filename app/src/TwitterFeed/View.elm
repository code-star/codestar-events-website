module TwitterFeed.View exposing (..)

--import Html.Events exposing (onClick)

import Html exposing (Attribute, Html, br, div, h4, iframe, img, input, p, program, section, text)
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


renderTweet : Tweet -> Html Msg
renderTweet tweet =
    div
        [ class "social-item" ]
        [ img [ src (tweetImageUrl tweet) ] []
        , div
            []
            [ h4
                []
                [ text (tweetUser tweet) ]

            --            , p
            --                []
            --                [ text tweet.createdAt ]
            , p
                []
                [ text tweet.text ]
            ]
        ]



-- TODO show placeholder
-- TODO filter and truncate to 4 items
-- TODO fill up available space
-- TODO call new Scala endpoint


isNotRetweet : Tweet -> Bool
isNotRetweet tweet =
--    let
--        _ = Debug.log "foo" tweet
--    in
    if tweet.retweetUsername == Nothing then
        True
    else
        False

-- TODO why is webpack not watching this file (or any other Elm file except Main.elm)?

renderTweets : List Tweet -> Html Msg
renderTweets tweets =
    let
        tweetLimit = 5
        tweetsAsRenderedTweets =
            List.filter isNotRetweet tweets
                |> List.take tweetLimit
                |> List.map renderTweet
--            List.map renderTweet tweet
--                |> List.filter isByCodestar
--                |> List.take 5

        placeholderTweet = div
                                           [ class "social-item social-item-placeholder" ]
                                           [ div
                                               []
                                               [ h4 [] []
                                               , p [] []
                                               ]
                                           ]
        placeholderTweets = List.repeat tweetLimit placeholderTweet
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


view : Model -> Html Msg
view model =
    div [ class "twitter-feed" ]
        [ div [ class "tweet-list" ]
            [ renderTweets model.tweets ]
        , div [ feedErrorStyle ]
            [ text model.message ]
        ]
