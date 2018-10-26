port module Port exposing (sendCache)

import Json.Encode exposing (Value, object, string)
import Model exposing (Cache)



-- Cache


port setCache : Value -> Cmd msg


sendCache : Cache -> Cmd msg
sendCache cache =
    cache
        |> encodeCache
        |> setCache


encodeCache : Cache -> Value
encodeCache cache =
    object
        [ ( "version", string cache.version )
        ]



-- Video
