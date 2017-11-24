module TwitterFeed.Rest exposing (..)

import Http exposing (Body, Header, Request, expectJson, header, stringBody)
import Json.Decode exposing (Decoder, at, bool, field, int, map7, oneOf, string, succeed)
import Json.Encode
import Task exposing(Task)
import TwitterFeed.State exposing (..)
import TwitterFeed.Types exposing (..)


-- note: request to twitter is blocked because of coc reasons. you need to do it via a server side app


authHeaders : List Header
authHeaders =
    [ header "Authorization" ("Basic " ++ encodedBearerToken)
    , header "Content-Type" "application/x-www-form-urlencoded;charset=UTF-8" ]

userTimelineHeaders : String -> List Header
userTimelineHeaders authToken =
    [ header "Authorization" ("Bearer " ++ authToken)
    , header "Content-Type" "application/x-www-form-urlencoded;charset=UTF-8" ]

method : String
method =
    "POST"


body : String
body =
    "grant_type=client_credentials"


makeRequest : String -> String -> List Header -> Body -> Decoder a -> Request a
makeRequest method url headers body resultDecoder =
    Http.request
        { method = method
        , headers = headers
        , url = url
        , body = body
        , expect = expectJson resultDecoder
        , timeout = Nothing
        , withCredentials = False
        }

getAuthToken : Task Http.Error String
getAuthToken =
    let
        body = "grant_type=client_credentials"
            |> Http.stringBody "application/x-www-form-urlencoded"
        post = makeRequest "POST" "http://localhost:8080/https://api.twitter.com/oauth2/token" authHeaders body tokenDecoder
      in
        post
            |> Http.toTask

getUserTimeline : String -> Task Http.Error (List Tweet)
getUserTimeline authToken =
    let
        body = "" |> Http.stringBody "application/x-www-form-urlencoded"
        post = makeRequest "GET" "http://localhost:8080/https://api.twitter.com/1.1/statuses/user_timeline.json?count=15&screen_name=Codestar_nl" ( userTimelineHeaders authToken ) body tweetsDecoder
      in
        post
            |> Http.toTask

fetchTweets : Task Http.Error (List Tweet)
fetchTweets =
    getAuthToken
        |> Task.andThen (\token -> getUserTimeline token)


tokenDecoder : Decoder String
tokenDecoder =
    field "access_token" Json.Decode.string


tweetsDecoder : Decoder (List Tweet)
tweetsDecoder =
    Json.Decode.list tweetDecoder


tweetDecoder : Decoder Tweet
tweetDecoder =
    Json.Decode.map7 Tweet
        (at ["user","name"] Json.Decode.string)
        (at ["user","screen_name"] Json.Decode.string)
        (at ["text"] Json.Decode.string)
        (at ["user","profile_image_url"] Json.Decode.string)
        (Json.Decode.maybe <| Json.Decode.field "retweeted_status" (at ["user","profile_image_url"] Json.Decode.string))
        (Json.Decode.maybe <| Json.Decode.field "retweeted_status" (at ["user","name"] Json.Decode.string))
        (at ["created_at"] Json.Decode.string)

