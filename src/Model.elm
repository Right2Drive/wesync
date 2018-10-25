module Model exposing (..)


import Browser.Navigation as Nav
import Url


-- Model


type alias Model =
  { key : Nav.Key
  , url : Url.Url
  , cache : Cache
  }


type alias Flags =
  { cache: Cache
  }


type alias Cache =
  { version: String
  }
