module VideoPlayer.Rest exposing (..)

import Http
import Json.Decode exposing (Decoder, bool, field, int, map2, oneOf, string, succeed)
import VideoPlayer.Types exposing (..)
import VideoPlayer.State exposing (..)

getVideos : ( String, String ) -> Cmd Msg
getVideos ( apiKey, playlistId ) =
    let
        url =
            "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails&key=" ++ apiKey ++ "&playlistId=" ++ playlistId ++ "&maxResults=50"
    in
    Http.send NewVideos (Http.get url videosDecoder)


videosDecoder : Decoder (List VideoItem)
videosDecoder =
    field "items" (Json.Decode.list videoDecoder)


videoDecoder : Decoder VideoItem
videoDecoder =
    Json.Decode.map4 VideoItem
        (field "snippet" (field "title" Json.Decode.string))
        (field "snippet" (field "description" Json.Decode.string))
        (field "contentDetails" (field "videoId" Json.Decode.string))
        (oneOf [ field "selected" bool, succeed False ])
