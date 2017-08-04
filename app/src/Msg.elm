module Msg exposing (..)

import Material


type Msg
    = Name String
    | Mdl (Material.Msg Msg)
