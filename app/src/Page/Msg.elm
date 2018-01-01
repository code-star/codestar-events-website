module Page.Msg exposing (..)

import Material
import DiceRoller.State exposing (..)


type Msg
    = Name String
    | Mdl (Material.Msg Msg)
    | MsgForDiceRoller DiceRollerMsg
