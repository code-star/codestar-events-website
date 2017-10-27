module TwitterFeed.State exposing (..)

import Http
import TwitterFeed.Types exposing (..)


type Msg
    = NewTweets (Result Http.Error (List Tweet))


youtubePlaylistId : String
youtubePlaylistId =
    "PLy227h3xpH-FcHw79drVFiVGMRDU8YhLH"


googleApiKey : String
googleApiKey =
    "AIzaSyDkTKtIGxMcyLX2IsfTpCvYr4n7WmMw3Jw"


maxVideoDescriptionLength : Int
maxVideoDescriptionLength =
    50


initialModel : Model
initialModel =
    { message = "Please select a video!"
    , tweets =
        [ { title = "test title"
          , text = "test text"
          },
          { title = "test title 2"
          , text = "test text 2"
          }
        ]
    }
