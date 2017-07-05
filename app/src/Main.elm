module Main exposing (..)

import Html exposing (Html, div, text, program, input, br, section)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

import Msg as Main exposing (..)

import GithubBanner.View exposing (..)

-- MAIN

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL
type alias Model =
    { name: String
    }

init : (Model, Cmd Msg)
init =
  (Model "Elm", Cmd.none)


-- UPDATE
updateCmd : Msg -> Model -> Cmd Msg
updateCmd msg model =
    Cmd.batch
        [ ]

updateModel : Msg -> Model -> Model
updateModel msg model =
    case msg of
        Name name ->
            { model | name = name }

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    (updateModel msg model, updateCmd msg model)

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- VIEW
view : Model -> Html Msg
view model =
    div []
    [ viewGithubBanner
    , section []
        [ input [ onInput Name, value model.name ] []
        , br [] []
        , text (String.reverse model.name) ]
    ]
