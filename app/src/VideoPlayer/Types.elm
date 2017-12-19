module VideoPlayer.Types exposing (..)

import Http exposing (Error)


type alias Model =
    { message : String
    , videos : List VideoItem
    , selectedVideoId : String
    }


type alias VideoItem =
    { title : String
    , description : String
    , videoId : String
    , selected : Bool
    }


type Msg
    = NewVideos (Result Error (List VideoItem))
    | SelectVideo VideoItem
