module Main exposing (..)

import Html exposing (Html, div, text, program, input, br, section, Attribute)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

import Msg as Main exposing (..)

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
    , selected: Bool

    }

videoItems : List VideoItem
videoItems = [{ title = "Title of video"
        , description = "Description of video"
        , videoId = "#ABC"
        , selected = True
        }
        , { title = "Title of video 2"
        , description = "Description of video 2"
        , videoId = "#DEF"
        , selected = False
        }
    ]

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

-- use a function to return a selected style or nothing
videoPlayerListItemSelectedStyle : VideoItem -> Attribute msg
videoPlayerListItemSelectedStyle v =
    if v.selected then
        style
          [ ("backgroundColor", "rgb(238,129,0)") ]
    else
        style[]

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


-- RENDER VIDEOS

toVideoItem : VideoItem -> Html msg
toVideoItem v =
  div [class "video-list-item", videoPlayerListItemStyle, videoPlayerListItemSelectedStyle v] [
      div [class "video-list-item-title", videoPlayerListItemTitleStyle] [
          text v.title
      ],
      div [class "video-list-item-description", videoPlayerListItemDescriptionStyle] [
          text v.description
      ]
  ]

renderVideos : List VideoItem -> Html msg
renderVideos video =
  div [] (List.map toVideoItem video)

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
        renderVideos videoItems
    ]
    ]
