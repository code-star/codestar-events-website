module Msg exposing (..)

import Material
import InfiniteScroll

type Msg = Name String
    | Mdl (Material.Msg Msg)
    | InfiniteScrollMsg InfiniteScroll.Msg