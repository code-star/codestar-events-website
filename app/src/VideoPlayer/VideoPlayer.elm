module Main exposing (..)

import Html
import VideoPlayer.Rest exposing (..)
import VideoPlayer.State exposing (..)
import VideoPlayer.Types exposing (..)
import VideoPlayer.View exposing (..)


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
    ( initialModel, getVideos ( googleApiKey, youtubePlaylistId ) )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewVideos (Ok videos) ->
            ( { model | videos = videos }, Cmd.none )

        NewVideos (Err _) ->
            ( { model | message = "Error while loading videos" }, Cmd.none )

        SelectVideo video ->
            ( { model | selectedVideoId = video.videoId }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
