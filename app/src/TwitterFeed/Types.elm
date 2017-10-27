module TwitterFeed.Types exposing (..)


type alias Model =
    { message : String
    , tweets : List Tweet
    }


type alias Tweet =
    { title : String
    , text : String
    }
