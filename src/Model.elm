module Model exposing (Cache, Flags, Model, defaultCache, defaultModel, update)

import Browser
import Browser.Navigation as Nav
import Message exposing (Msg(..))
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
    { cache : Cache
    }


type alias Cache =
    { version : String
    }


defaultCache : Cache
defaultCache =
    { version = "0.0.1"
    }



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )
