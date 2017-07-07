module Main exposing (..)

import Html exposing (Html, div, text, program, input, br, section, p, img, h4)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

import Material.Grid exposing (grid, cell, size, Device(..))
import Material.Button as Button
import Material.Options as Options exposing (Style)
import Material

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
    , mdl : Material.Model
    }

init : (Model, Cmd Msg)
init =
  (Model "Elm" Material.model, Cmd.none)


-- UPDATE
updateCmd : Msg -> Model -> Cmd Msg
updateCmd msg model =
    Cmd.batch
        [ ]

-- button example: https://github.com/debois/elm-mdl/blob/master/demo/Demo/Buttons.elm
updateModel : Msg -> Model -> Model
updateModel msg model =
    case msg of
        Mdl msg_ -> 
            -- Material.update Mdl msg_ model
            model
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
            , ("display", "flex")
            , ("align-items", "center")
            ]
        ]
        --[ input [ onInput Name, value model.name ] []
        --, br [] []
        --, text (String.reverse model.name)
        [ grid []
            --[ cell [ Material.Grid.size All 4 ]
            --    [ h4 [] [text "Cell 1"]
            --    ]
            --, cell [ Material.Grid.offset All 2, Material.Grid.size All 4 ]
            --    [ h4 [] [text "Cell 2"]
            --    , p [] [text "This cell is offset by 2"]
            --    ]
            --, cell [ Material.Grid.size All 6 ]
            --    [ h4 [] [text "Cell 3"]
            --    ]
            --, cell [ Material.Grid.size Tablet 6, Material.Grid.size Desktop 12, Material.Grid.size Phone 2 ]
            --    [ h4 [] [text "Cell 4"]
            --    , p [] [text "Size varies with device"]
            --    ]
            [ cell [ Material.Grid.offset All 3, Material.Grid.size All 6 ]
                [ img 
                    [ src "/img/codestar-logo.svg"
                    , width 382     
                    ] []
                , p [] [ text "De mogelijkheden in de digitale wereld zijn eindeloos. Uitdagingen vaak complex. Wij ontwikkelen moderne software die simpel te gebruiken is. Agile en productief, met gebruik van de nieuwste technieken. Wij programmeren. Met ons hoofd én met ons hart. Voor organisaties die de volgende stap willen zetten." ]
                , p [] [ text "Wij zijn de #1 partner voor Full Stack Scala en Big Data oplossingen in Nederland. Wij zijn Codestar." ]
                , Button.render Mdl [0] model.mdl
                  [ Button.raised
                  -- , Options.onClick MyClickMsg
                  ]
                  [ text "Menu NYI"]
                ]
            ]
        ]
    ]


-- Material.Grid requires you to load in the Material CSS. So can't use elm-reactor
-- Use npm-watch for now (bugs in MacOS Sierra)
-- Use webpack later?
-- Add task for elm-format