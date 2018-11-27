module View exposing (view)

import Browser
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Message exposing (Msg(..))
import Model exposing (Model)
import Nav exposing (Route(..), FooterRoute(..))
import Page.About
import Page.Donations
import Page.Home
import Page.NotFound
import Page.Video
import Page.NoHost
import Url exposing (Url)


view : Model -> Browser.Document Msg
view model =
    { title = Nav.routeToTitle model.route , body =
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
            Nav.routeToClass model.route
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
    viewRoute model


viewRoute : Model -> List (Html Msg)
viewRoute model =
    let
        routeClass =
            Nav.routeToClass model.route

    in
        (viewMain model) ++ (viewFooter model)


viewFooter : Model -> List (Html Msg)
viewFooter model =
    let
        maybeFooterRoute =
            case model.route of
                Home footerRoute ->
                    Just footerRoute

                _ -> Nothing

        footerContents =
            case maybeFooterRoute of
                Just footerRoute ->
                    viewFooterRoute footerRoute model

                Nothing ->
                    []

    in
        case List.length footerContents of
            0 ->
                [] -- If no footer want empty list

            _ ->
                [ footer
                    [ class "footer"
                    , css
                        [ -- TODO: Styles for footer
                        ]
                    ]
                    footerContents
                ]


viewFooterRoute : FooterRoute -> Model -> List (Html Msg)
viewFooterRoute footerRoute model =
    case footerRoute of
        Closed ->
            []

        About ->
            []

        Donations ->
            []

        Changelog ->
            []


viewMain : Model -> List (Html Msg)
viewMain model =
    let
        contents =
            []
    
    in
        [ main_
            [ css
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
