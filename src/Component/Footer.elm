module Component.Footer exposing (view)

import Model exposing (Model)
import Css exposing (..)
import Css.Transitions exposing (transition, easeInOut)
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
                    , fontSize (rem 1.7)
                    , fontWeight normal
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
                ]
            ]
            [ footerRouteItem About
            , footerRouteItem Donations
            , footerLink "github" "https://github.com/wesyncvideo/wesync-web"
            ]
        ]


footerLink : String -> String -> Html Msg
footerLink name url =
    rightFooterItem name (href url)


footerRouteItem : FooterRoute -> Html Msg
footerRouteItem footerRoute =
    let
        prop =
            footerRoute
                |> ChangeFooterRoute
                |> onClick
        
        name =
            footerRoute
                |> Nav.footerRouteToName

    in
        rightFooterItem name prop


rightFooterItem : String -> Attribute Msg -> Html Msg
rightFooterItem name prop =
    a
        [ class "link"
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
            ]
        ]
        [ text name ]
