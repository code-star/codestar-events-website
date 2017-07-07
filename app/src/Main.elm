module Main exposing (..)

import Html exposing (Html, div, text, program, input, br, section, p, img)
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
    div [ style
            [ ("background-color", "#0f569a") 
            , ("color", "white")
            , ("height", "100vh")
            ]
        ]
    [ viewGithubBanner
    , section 
        [ style 
            [ ("text-align", "center")
            , ("height", "100vh")
            ]
        ]
        [ input [ onInput Name, value model.name ] []
        , br [] []
        , text (String.reverse model.name) 
        , img 
            [ src "/app/img/codestar-logo.svg"
            , width 382     
            ] []
        , p [] [ text "De mogelijkheden in de digitale wereld zijn eindeloos. Uitdagingen vaak complex. Wij ontwikkelen moderne software die simpel te gebruiken is. Agile en productief, met gebruik van de nieuwste technieken. Wij programmeren. Met ons hoofd én met ons hart. Voor organisaties die de volgende stap willen zetten." ]
        , p [] [ text "Wij zijn de #1 partner voor Full Stack Scala en Big Data oplossingen in Nederland. Wij zijn Codestar." ]
        ]
    ]
