module Page.Msg exposing (..)

import DiceRoller.State exposing (DiceRollerMsg)
import Material
import TwitterFeed.State exposing (TwitterFeedMsg)


type Msg
    = Name String
    | Mdl (Material.Msg Msg)
    | MsgForDiceRoller DiceRollerMsg
    | MsgForTwitterFeed TwitterFeedMsg
