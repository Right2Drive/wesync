module Model exposing (..)


import Browser.Navigation as Nav
import Url


-- Model


type alias Model =
  { key : Nav.Key
  , url : Url.Url
  , cache : Cache
  , title : String
  }


defaultModel : Url.Url -> Nav.Key -> Cache -> Model
defaultModel url key cache =
  { key = key
  , url = url
  , cache = cache
  -- TODO: Generate from current url
  , title = "WeSync Video | TODO"
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
