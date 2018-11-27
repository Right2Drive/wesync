module View exposing (view)

import Browser
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Message exposing (Msg(..))
import Model exposing (Model)
import Nav exposing (Route(..), urlToClass)
import Page.About
import Page.Donations
import Page.Home
import Page.NotFound
import Page.Video
import Page.NoHost
import Url exposing (Url)


view : Model -> Browser.Document Msg
view model =
    { title = Nav.urlToTitle model.url
    , body =
        model
            |> viewBody
            |> List.map toUnstyled
    }


viewBody : Model -> List (Html Msg)
viewBody model =
    let
        contents =
            viewUrl model

        routeClass =
            urlToClass model.url
    in
    [ main_
        [ class ("page " ++ routeClass)
        , css
            [ displayFlex
            , flexDirection column
            , Css.height (vh 100)
            , Css.width (vw 100)
            , fontSize (Css.em 1)
            , position relative
            ]
        ]
        contents
    ]


viewUrl : Model -> List (Html Msg)
viewUrl model =
    model.url
        |> Nav.urlToRoute
        |> viewRoute model


viewRoute : Model -> Nav.Route -> List (Html Msg)
viewRoute model route =
    case route of
        NotFound ->
            Page.NotFound.view model

        Home ->
            Page.Home.view model

        Video uuid ->
            Page.Video.view model uuid

        NoHost uuid ->
            Page.NoHost.view model uuid

        About ->
            Page.About.view model

        Donations ->
            Page.Donations.view model
