module Main exposing (..)

import Html
import TwitterFeed.Rest exposing (..)
import TwitterFeed.State exposing (..)
import TwitterFeed.Types exposing (..)
import TwitterFeed.View exposing (..)


-- Structure of this module is based on http://blog.jenkster.com/2016/04/how-i-structure-elm-apps.html


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( initialModel, getTweets ( googleApiKey, youtubePlaylistId ) )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewTweets (Ok tweets) ->
            ( { model | tweets = tweets }, Cmd.none )

        NewTweets (Err _) ->
            ( { model | message = "Error while loading tweets!" }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
