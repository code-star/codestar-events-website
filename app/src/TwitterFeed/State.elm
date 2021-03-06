module TwitterFeed.State exposing (..)

import Http
import TwitterFeed.Types exposing (..)


type TwitterFeedMsg
    = NewTweets (Result Http.Error (List Tweet))


twitterOAuthTokenUrl : String
twitterOAuthTokenUrl =
    "https://api.twitter.com/oauth2/token"


twitterApiKey : String
twitterApiKey =
    "LugliFfgdwkNQWyv3miN2HQDl"


twitterApiSecret : String
twitterApiSecret =
    "k6YGB4f7FQnQFghf4u4yOXazEerpPQIrzCWe9b554Mo92ACNer"


encodedBearerToken : String
encodedBearerToken =
    "THVnbGlGZmdkd2tOUVd5djNtaU4ySFFEbDprNllHQjRmN0ZRblFGZ2hmNHU0eU9YYXpFZXJwUFFJcnpDV2U5YjU1NE1vOTJBQ05lcg=="


maxVideoDescriptionLength : Int
maxVideoDescriptionLength =
    50


initialModel : Model
initialModel =
    { message = ""
    , tweets = []
    }
