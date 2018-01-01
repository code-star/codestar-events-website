module TwitterFeed.Update exposing (..)

import Html
import Http exposing (Request)
import Page.Msg as Main exposing (..)
import Task
import TwitterFeed.Rest exposing (..)
import TwitterFeed.State exposing (..)
import TwitterFeed.Types exposing (..)
import TwitterFeed.View exposing (..)


-- Structure of this module is based on http://blog.jenkster.com/2016/04/how-i-structure-elm-apps.html
--main =
--    Html.program
--        { init = init
--        , view = view
--        , update = update
--        , subscriptions = subscriptions
--        }
--
--
--init : ( Model, Cmd Msg )
--init =
--    ( initialModel, initCmd )


initTwitterFeedCmd : Cmd TwitterFeedMsg
initTwitterFeedCmd =
    Task.attempt NewTweets fetchTweets



--update : Msg -> Model -> ( Model, Cmd Msg )
--update msg model =
--    case msg of
--        NewTweets (Ok tweets) ->
--            ( { model | tweets = tweets, message = "" }, Cmd.none )
--
--        NewTweets (Err _) ->
--            ( { model | message = "Error while fetching tweets!" }, Cmd.none )


updateTwitterFeedModel : TwitterFeedMsg -> Model -> Model
updateTwitterFeedModel msg model =
    case msg of
        NewTweets (Ok tweets) ->
            { model | tweets = tweets, message = "" }

        NewTweets (Err _) ->
            { model | message = "Error while fetching tweets!" }



-- SUBSCRIPTIONS
--subscriptions : Model -> Sub Msg
--subscriptions model =
--    Sub.none
