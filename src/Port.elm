port module Port exposing (..)


import Json.Encode as E


-- Storage


port setCache : E.Value -> Cmd msg


-- Video
