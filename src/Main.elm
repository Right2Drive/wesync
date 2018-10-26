module Main exposing (Route(..), UrlRequest(..), init, main, routeParser, subscriptions, titleFromPath, update, view)

-- TODO: How to only import specific messages
-- TODO: How to use Msg.Example namespacing

import Browser
import Browser.Navigation as Nav
import Flag
import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Decode as D
import Message exposing (Msg(..))
import Model exposing (Model, defaultModel)
import Page.About
import Page.Donations
import Page.Home
import Page.Video
import Port
import Url
import Url.Parser as P



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



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- Nav


type Route
    = Home
    | Video
    | About
    | Donations


type UrlRequest
    = Internal Url.Url
    | External String


routeParser : P.Parser (Route -> a) a
routeParser =
    P.oneOf
        [ P.map Home (P.s "home")
        , P.map Video (P.s "video")
        , P.map About (P.s "about")
        , P.map Donations (P.s "donations")
        ]


titleFromPath : Url.Url -> String
titleFromPath url =
    -- TODO: implement this
    "WeSync Video"



-- View


view : Model -> Browser.Document Msg
view model =
    { title = titleFromPath model.url
    , body =
        [ div [] [ text "test string" ]
        ]
    }



-- Main --


init : D.Value -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        cache =
            Flag.initCache flags
    in
    ( defaultModel url key cache
    , Port.sendCache cache
    )


main : Program D.Value Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }
