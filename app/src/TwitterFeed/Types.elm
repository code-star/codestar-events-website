module TwitterFeed.Types exposing (..)


type alias Model =
    { message : String
    , authToken : String
    , tweets : List Tweet
    }


type alias Tweet =
    { title : String
    , text : String
    }
