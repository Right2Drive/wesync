module View exposing (view)

import Browser
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Message exposing (Msg(..))
import Model exposing (Model)
import Nav exposing (Route(..), toRoute, urlToClass)
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
            , position absolute
            , Css.height (vh 100)
            , Css.width (vw 100)
            ]
        ]
        [ contents
        ]
    ]


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
