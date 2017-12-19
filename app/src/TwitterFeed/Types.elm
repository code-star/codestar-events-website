module TwitterFeed.Types exposing (..)


type alias Model =
    { message : String
    , tweets : List Tweet
    }


type alias Tweet =
    { userName : String
    , screenName : String
    , text : String
    , imgUrl : String
    , retweetImgUrl : Maybe String
    , retweetUsername : Maybe String
    , createdAt : String
    }
