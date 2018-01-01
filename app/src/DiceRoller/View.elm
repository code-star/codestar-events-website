module DiceRoller.View exposing (..)

import DiceRoller.State exposing (..)
import DiceRoller.Types exposing (..)
import Html exposing (Html, button, div, h2, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Page.Msg as Main exposing (..)


--import Panel.View exposing (..)


viewDiceRoller : DiceRoller -> Html Msg
viewDiceRoller model =
    div []
        [ button [ onClick (MsgForDiceRoller Roll) ] [ text "Roll 100-sided dice" ]
        , h2 [] [ text (toString model.dieFace) ]
        ]
