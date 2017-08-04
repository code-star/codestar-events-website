module Msg exposing (..)

import InfiniteScroll
import Material


type Msg
    = Name String
    | Mdl (Material.Msg Msg)
    | InfiniteScrollMsg InfiniteScroll.Msg
