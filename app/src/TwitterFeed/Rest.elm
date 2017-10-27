module TwitterFeed.Rest exposing (..)

import Http
import Json.Decode exposing (Decoder, bool, field, int, map2, oneOf, string, succeed)
import TwitterFeed.State exposing (..)
import TwitterFeed.Types exposing (..)


getTweets : ( String, String ) -> Cmd Msg
getTweets ( apiKey, playlistId ) =
    let
        url =
            "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails&key=" ++ apiKey ++ "&playlistId=" ++ playlistId ++ "&maxResults=50"
    in
    Http.send NewTweets (Http.get url tweetsDecoder)


tweetsDecoder : Decoder (List Tweet)
tweetsDecoder =
    field "items" (Json.Decode.list tweetDecoder)


tweetDecoder : Decoder Tweet
tweetDecoder =
    Json.Decode.map2 Tweet
        (field "snippet" Json.Decode.string)
        (field "snippet" Json.Decode.string)
