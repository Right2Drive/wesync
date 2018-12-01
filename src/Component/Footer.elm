module Component.Footer exposing (view)

import Model exposing (Model)
import Css exposing (..)
import Css.Transitions exposing (transition, easeInOut)
import Style.Media as Media
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (..)
import Message exposing (Msg(..))
import Style.Theme as Theme
import Style.Font as Font
import Assets.Svg as Svg
import Svg.Styled.Attributes as SvgAttributes
import Nav exposing (FooterRoute(..))


view : Model -> Html Msg
view model =
    div
        [ css
            [ displayFlex
            , flexDirection row
            , justifyContent spaceBetween
            , Css.height (px 50)
            , backgroundColor Theme.darker
            ]
        ]
        [ div
            [ class "left"
            , css
                [ displayFlex
                , alignItems center
                , fontFamilies Font.satisfy
                , color Theme.dimWhite
                ]
            ]
            [ h1
                [ class "logo"
                , css
                    [ margin4 (px 0) (px 3) (px 0) (px 26)
                    , fontSize (rem 1.7)
                    , fontWeight normal
                    , Media.mobile
                        [ fontSize (rem 1.2) ]
                    ]
                ]
                [ text "WeSync" ]
            , h2
                [ class "version"
                , onClick <| ChangeFooterRoute Changelog
                , css
                    [ position relative
                    , top (px 3)
                    , margin4 (px 0) (px 0) (px 0) (px 0)
                    , padding (px 3)
                    , fontSize (rem 0.9)
                    , fontWeight normal
                    , Media.mobile
                        [ fontSize (rem 0.7)
                        , marginLeft (px 3)
                        ]
                    ]
                ]
                [ text model.cache.version ]
            ]
        , div
            [ class "right"
            , css
                [ displayFlex
                , alignItems center
                , Css.height (pct 100)
                , overflow Css.hidden
                , marginRight (px 30)
                , Media.mobile
                    [ marginRight (px 10)
                    ]
                ]
            ]
            [ footerRouteItem About Svg.info
            , footerRouteItem Donations Svg.gift
            , footerLink "github" Svg.github "https://github.com/wesyncvideo/wesync-web"
            ]
        ]


footerLink : String -> Svg.Svg Msg -> String -> Html Msg
footerLink name svg url =
    rightFooterItem name svg (href url)


footerRouteItem : FooterRoute -> Svg.Svg Msg -> Html Msg
footerRouteItem footerRoute svg =
    let
        prop =
            footerRoute
                |> ChangeFooterRoute
                |> onClick
        
        name =
            footerRoute
                |> Nav.footerRouteToName

    in
        rightFooterItem name svg prop


rightFooterItem : String -> Svg.Svg Msg -> Attribute Msg -> Html Msg
rightFooterItem name svg prop =
    div
        [ class "link" ]
        [ a
            [ class "desktop"
            , prop
            , css
                [ position relative
                , top (px 2)
                , textTransform uppercase
                , margin4 (px 0) (px 0) (px 0) (px 20)
                , textDecoration none
                , color Theme.dimmerWhite
                , fontFamilies Font.josefin
                , fontSize (rem 1.2)
                , cursor pointer
                , hover
                    [ color Theme.dimWhite
                    ]
                , transition
                    <| List.singleton
                    <| Css.Transitions.color3 150 0 easeInOut
                , Media.mobile
                    [ display none ]
                ]
            ]
            [ text name ]
        , svg
            [ SvgAttributes.class "mobile"
            , SvgAttributes.css
                [ fill Theme.dimmerWhite
                , Css.height (px 28)
                , Css.width (px 28)
                , margin4 (px 0) (px 13) (px 0) (px 0)
                , hover
                    [ fill Theme.dimWhite
                    ]
                , Media.desktop
                    [ display none ]
                ]
            ]
        ]
