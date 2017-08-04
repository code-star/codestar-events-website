module VideoPlayer.Types exposing (..)

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
