module DiceRoller.State exposing (..)

import DiceRoller.Types exposing (..)


type DiceRollerMsg
    = Roll
    | NewFace Int


initialDiceRoller : DiceRoller
initialDiceRoller =
    { dieFace = 1
    }


model : DiceRoller
model =
    initialDiceRoller
