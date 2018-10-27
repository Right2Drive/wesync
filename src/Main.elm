module Main exposing (init, main, subscriptions)

import Browser
import Browser.Navigation as Nav
import Flag
import Json.Decode as D
import Message exposing (Msg(..))
import Model exposing (Model, defaultModel, update)
import Nav
import Port
import Url exposing (Url)
import View exposing (view)



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- Main --


init : D.Value -> Url -> Nav.Key -> ( Model, Cmd Msg )
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
