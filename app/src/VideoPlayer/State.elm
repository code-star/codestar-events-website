module VideoPlayer.State exposing (..)

import Http
import VideoPlayer.Types exposing (..)

type Msg
    = NewVideos (Result Http.Error (List VideoItem))
    | SelectVideo VideoItem

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
    , videos = []
    , selectedVideoId = "Dl5eCpaT430"
    }

