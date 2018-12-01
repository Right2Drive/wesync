module Model exposing (Cache, Flags, Model, defaultCache, defaultModel, update)

import Nav exposing (Route(..))
import Browser
import Browser.Navigation as Nav
import Message exposing (Msg(..))
import Url



-- Model


type alias Model =
    -- Global
    { key : Nav.Key
    , route : Route
    , cache : Cache
    , uuid : String
    
    -- Peer
    , hostUuid : String

    -- Footer
    }


-- TODO: How to handle the default link including /watch/<uuid>/

defaultModel : Url.Url -> Nav.Key -> Cache -> Model
defaultModel url key cache =
    { key = key
    , route = resolveRouteFromUrl url
    , cache = cache
    , uuid = ""
    , hostUuid = resolveHostUuidFromUrl url ""
    }


type alias Flags =
    { cache : Cache
    }


type alias Cache =
    { version : String
    }


defaultCache : Cache
defaultCache =
    { version = "0.0.2"
    }


-- Update


resolveRouteFromUrl : Url.Url -> Route
resolveRouteFromUrl url =
    let
        route =
            Nav.urlToRoute url

    in
        case route of
            Watch footerRoute "" ->
                route

            Watch footerRoute uuid ->
                Watch footerRoute ""

            _ ->
                route


resolveHostUuidFromUrl : Url.Url -> String -> String
resolveHostUuidFromUrl url oldHostUuid =
    let
        route =
            Nav.urlToRoute url

    in
        case route of
            Watch footerRoute "" ->
                oldHostUuid

            Watch footerRoute uuid ->
                uuid

            _ ->
                oldHostUuid


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
            (   { model
                | route = resolveRouteFromUrl url
                , hostUuid = resolveHostUuidFromUrl url model.hostUuid
                }
            , Cmd.none
            )

        ChangeFooterRoute footerRoute ->
            ( model
            , Cmd.none
            )
