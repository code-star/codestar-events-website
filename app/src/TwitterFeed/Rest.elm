module TwitterFeed.Rest exposing (..)

import Http exposing (Body, Header, Request, expectJson, header, stringBody)
import Json.Decode exposing (Decoder, bool, field, int, map2, oneOf, string, succeed)
import Json.Encode
import TwitterFeed.State exposing (..)
import TwitterFeed.Types exposing (..)

-- note: request to twitter is blocked because of coc reasons. you need to do it via a server side app
headers : List Header
headers =
    [ header "Authorization" ("Basic " ++ encodedBearerToken)
    , header "Content-Type" "application/x-www-form-urlencoded;charset=UTF-8" ]

method : String
method =
    "POST"

body : String
body =
    "grant_type=client_credentials"

makeRequest : String -> String -> Body -> Decoder a -> Request a
makeRequest method url body resultDecoder =
    Http.request
        { method = method
        , headers = headers
        , url = url
        , body = body
        , expect = expectJson resultDecoder
        , timeout = Nothing
        , withCredentials = True
        }

getTweets : Cmd Msg
getTweets =
    let
        body = "grant_type=client_credentials"
            |> Http.stringBody "application/x-www-form-urlencoded"
        post = makeRequest "POST" "https://api.twitter.com/oauth2/token" body tokenDecoder
      in
        Http.send NewToken post


tokenDecoder : Decoder String
tokenDecoder =
    field "access_token" Json.Decode.string

tweetsDecoder : Decoder (List Tweet)
tweetsDecoder =
    field "items" (Json.Decode.list tweetDecoder)


tweetDecoder : Decoder Tweet
tweetDecoder =
    Json.Decode.map2 Tweet
        (field "snippet" Json.Decode.string)
        (field "snippet" Json.Decode.string)
