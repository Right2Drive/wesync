module View exposing (view)

import Browser
import Html exposing (Html, div, main_, text)
import Html.Attributes exposing (class)
import Message exposing (Msg(..))
import Model exposing (Model)
import Nav exposing (Route(..), toRoute)
import Page.About
import Page.Donations
import Page.Home
import Page.NotFound
import Page.Video
import Page.VideoNotFound
import Url exposing (Url)


view : Model -> Browser.Document Msg
view model =
    { title = Nav.urlToTitle model.url
    , body =
        [ main_ [ class "page" ]
            [ viewUrl model
            ]
        ]
    }


viewUrl : Model -> Html Msg
viewUrl model =
    model.url
        |> Url.toString
        |> toRoute
        |> viewRoute model


viewRoute : Model -> Nav.Route -> Html Msg
viewRoute model route =
    case route of
        NotFound ->
            Page.NotFound.view model

        Home ->
            Page.Home.view model

        Video uuid ->
            Page.Video.view model uuid

        VideoNotFound uuid ->
            Page.VideoNotFound.view model uuid

        About ->
            Page.About.view model

        Donations ->
            Page.Donations.view model
