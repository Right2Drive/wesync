module Component.Footer exposing (view)

import Model exposing (Model)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (..)
import Message exposing (Msg(..))
import Style.Theme as Theme
import Style.Font as Font
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
                    , fontSize (px 28)
                    , fontWeight normal
                    ]
                ]
                [ text "WeSync" ]
            , h2
                [ class "version"
                , css
                    [ position relative
                    , top (px 3)
                    , margin4 (px 0) (px 0) (px 0) (px 0)
                    , padding (px 3)
                    , fontSize (px 13)
                    , fontWeight normal
                    ]
                ]
                [ text model.cache.version ]
            ]
        , div
            [ class "right"
            , css
                [ displayFlex
                -- TODO: Switch direction of render
                ]
            ]
            [ footerRouteItem About
            , footerRouteItem Donations
            ]
        ]


footerRouteItem : FooterRoute -> Html Msg
footerRouteItem footerRoute =
    rightFooterItem (Nav.footerRouteToString footerRoute) (ChangeFooterRoute footerRoute) 


rightFooterItem : String -> Msg -> Html Msg
rightFooterItem name msg =
    span
        [ class "link"
        , onClick msg
        , css
            [ textTransform uppercase
            , margin4 (px 0) (px 0) (px 0) (px 10)
            ]
        ]
        [ text name ]
