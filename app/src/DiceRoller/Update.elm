module DiceRoller.Update exposing (..)

import Page.Msg as Main exposing (..)
import DiceRoller.Types exposing (DiceRoller)
import DiceRoller.State exposing (DiceRollerMsg, initialDiceRoller)
import Random

updateDiceRoller : DiceRollerMsg -> DiceRoller -> DiceRoller
updateDiceRoller msg model =
    case msg of
        DiceRoller.State.Roll ->
            model
        DiceRoller.State.NewFace newFace ->
            { model | dieFace = newFace}

updateDiceRollerCmd : Msg -> Cmd Msg
updateDiceRollerCmd msg =
    case msg of
        MsgForDiceRoller DiceRoller.State.Roll ->
            Random.generate DiceRoller.State.NewFace (Random.int 1 100)
                |> Cmd.map MsgForDiceRoller
        _ ->
            Cmd.none