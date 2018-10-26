module Model exposing (..)


import Browser.Navigation as Nav
import Url


-- Model


type alias Model =
  { key : Nav.Key
  , url : Url.Url
  , cache : Cache
  }


defaultModel : Url.Url -> Nav.Key -> Cache -> Model
defaultModel url key cache =
  { key = key
  , url = url
  , cache = cache
  }


type alias Flags =
  { cache: Cache
  }


type alias Cache =
  { version: String
  }


defaultCache : Cache
defaultCache =
  { version = "0.0.1"
  }
