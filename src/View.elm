module View exposing (view)

import Browser
import Component.Footer
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Message exposing (Msg(..))
import Model exposing (Model)
import Nav exposing (FooterRoute(..), Route(..))
import Page.About
import Page.Changelog
import Page.Donations
import Page.Home
import Page.NoHost
import Page.NotFound
import Page.Video
import Url exposing (Url)


view : Model -> Browser.Document Msg
view model =
    { title = Nav.routeToTitle model.route
    , body =
        model
            |> viewRoute
            |> List.singleton
            |> List.map toUnstyled
    }


viewRoute : Model -> Html Msg
viewRoute model =
    let
        routeClass =
            Nav.routeToClass model.route

        pageContents =
            viewMain model

        footerContents =
            viewFooter model
    in
    div
        [ class ("route " ++ routeClass)
        , css
            [ displayFlex
            , flexDirection column
            , Css.height (vh 100)
            , Css.width (vw 100)
            , overflow Css.hidden
            ]
        ]
        [ pageContents
        , footerContents
        ]


viewFooter : Model -> Html Msg
viewFooter model =
    let
        maybeFooterRoute =
            case model.route of
                Home footerRoute ->
                    Just footerRoute

                Watch footerRoute _ ->
                    Just footerRoute

                Host footerRoute ->
                    Just footerRoute

                _ ->
                    Nothing

        footerContents =
            case maybeFooterRoute of
                Just footerRoute ->
                    [ viewFooterRoute footerRoute model ]

                Nothing ->
                    []
    in
    case List.length footerContents of
        0 ->
            text ""

        _ ->
            footer
                [ class "footer"
                , css
                    [ displayFlex
                    , flexDirection column
                    ]
                ]
                [ Component.Footer.view model
                , div
                    [ class "footer-contents"
                    , css
                        [ flexGrow (num 1)
                        , flexBasis auto
                        , Css.height zero
                        ]
                    ]
                    footerContents
                ]


viewFooterRoute : FooterRoute -> Model -> Html Msg
viewFooterRoute footerRoute model =
    case footerRoute of
        Closed ->
            text ""

        About ->
            Page.About.view model

        Donations ->
            Page.Donations.view model

        Changelog ->
            Page.Changelog.view model


viewMain : Model -> Html Msg
viewMain model =
    let
        contents =
            case model.route of
                Watch _ _ ->
                    Page.Video.view model

                Host _ ->
                    Page.Video.view model

                Home _ ->
                    Page.Home.view model

                NotFound ->
                    Page.NotFound.view model
    in
    main_
        [ css
            [ displayFlex
            , flexDirection column
            , flexGrow (num 1)
            , fontSize (Css.em 1)
            , position relative
            ]
        ]
        contents
