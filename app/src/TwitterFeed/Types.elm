module TwitterFeed.Types exposing (..)


type alias Model =
    { message : String
    , tweets : List Tweet
    }


type alias Tweet =
    { userName : String
    , screenName : String
    , text : String
    , id : String
    , imgUrl : String
    , retweetImgUrl : Maybe String
    , retweetUsername : Maybe String
    , retweetScreenname : Maybe String
    , createdAt : String
    }
