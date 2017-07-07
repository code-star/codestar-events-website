module Main exposing (..)

import Html exposing (Html, div, text, program, input, br, section, Attribute)
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

type alias VideoItem =
    { title: String
    , description: String
    , videoId: String

    }

init : (Model, Cmd Msg)
init =
  (Model "Elm", Cmd.none)



-- STYLES
-- TODO: make a stylesheet for this?
videoPlayerStyle : Attribute msg
videoPlayerStyle =
    style
      [ ("height", "500px")
      , ("width", "900px")
      , ("fontFamily", "Arial, Helvetica, sans-serif")
      ]

videoPlayerVideoStyle : Attribute msg
videoPlayerVideoStyle =
    style
      [ ("backgroundColor", "#000")
      , ("height", "100%")
      , ("width", "60%")
      , ("float", "left")
      , ("overflow", "hidden")
      , ("color", "#fff")
      ]

videoPlayerListStyle : Attribute msg
videoPlayerListStyle =
    style
      [ ("backgroundColor", "#232323")
      , ("height", "100%")
      , ("width", "40%")
      , ("float", "right")
      , ("overflow", "hidden")
      ]

videoPlayerListItemStyle : Attribute msg
videoPlayerListItemStyle =
    style
      [ ("height", "70px")
      , ("width", "100%")
      , ("borderBottom", "1px solid #393939")
      , ("padding", "15px")
      , ("color", "#ddd")
      , ("boxSizing", "border-box")
      ]

videoPlayerListItemSelectedStyle : Attribute msg
videoPlayerListItemSelectedStyle =
    style
      [ ("backgroundColor", "rgb(238,129,0)")
      ]

videoPlayerListItemTitleStyle : Attribute msg
videoPlayerListItemTitleStyle =
    style
      [ ("color", "#fff")
      , ("fontSize", "14px")
      , ("overflow", "hidden")
      , ("marginBottom", "10px")
      ]

videoPlayerListItemDescriptionStyle : Attribute msg
videoPlayerListItemDescriptionStyle =
    style
      [ ("fontSize", "11px")
      , ("overflow", "hidden")
      ]

-- 238, 129, 0



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
    div [class "video-player", videoPlayerStyle]
    [ div [class "video-container", videoPlayerVideoStyle] [text ("test")]
    , div [class "video-list", videoPlayerListStyle] [
        div [class "video-list-item", videoPlayerListItemStyle, videoPlayerListItemSelectedStyle] [
            div [class "video-list-item-title", videoPlayerListItemTitleStyle] [
                text("Title of video")
            ],
            div [class "video-list-item-description", videoPlayerListItemDescriptionStyle] [
                text("Description of this video...")
            ]
        ]
        , div [class "video-list-item", videoPlayerListItemStyle] [
              div [class "video-list-item-title", videoPlayerListItemTitleStyle] [
                  text("Title of video")
              ],
              div [class "video-list-item-description", videoPlayerListItemDescriptionStyle] [
                  text("Description of this video...")
              ]
          ]
    ]
    ]
