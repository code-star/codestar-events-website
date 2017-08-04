module Msg exposing (..)

import Http
import InfiniteScroll
import Material


type Msg
    = Name String
    | Mdl (Material.Msg Msg)
    | InfiniteScrollMsg InfiniteScroll.Msg
    | OnDataRetrieved (Result Http.Error String)
