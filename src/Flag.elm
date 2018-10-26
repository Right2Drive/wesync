module Flag exposing (initCache)


import Json.Decode exposing (Value, Decoder, succeed, decodeValue, field, string, map)
import Json.Decode.Pipeline exposing (optional)
import Model exposing (Cache, defaultCache)


initCache : Value -> Cache
initCache value =
  case decodeValue cacheDecoder value of

    Ok cache -> cache

    Err _ -> defaultCache


cacheDecoder : Decoder Cache
cacheDecoder =
  field "cache"
    ( succeed Cache
      |> optional "version" string defaultCache.version
    )
