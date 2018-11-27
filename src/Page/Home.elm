module Page.Home exposing (view)

import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (onClick)
import Svg.Styled
import Svg.Styled.Attributes
import Css exposing (..)
import Css.Global
import Css.Transitions exposing (Transition, transition, easeInOut)
import Message exposing (Msg(..))
import Model exposing (Model)
import Style.Theme as Theme
import Style.Font as Font
import Assets.Svg


type alias Panel =
    { name : String
    , class : String
    , icon : List (Svg.Styled.Attribute Msg) -> Html Msg
    , iconSize : Int
    , inactiveColor : Color
    , activeColor : Color
    , inactiveItemColor : Color
    , activeItemColor : Color
    }


view : Model -> List (Html Msg)
view model =
    [ div
        [ class "panels"
        , css
            [ displayFlex
            , flexDirection row
            , Css.height (px 0)
            , flexGrow (int 1)
            ]
        ]
        [ viewPanel hostPanel
            []
        , viewPanel watchPanel
            []
        ]
    , div
        [ class "filler"
        , css
            [ Css.height footerHeight
            ]
        ]
        []
    ]

footerHeight : Px
footerHeight =
    px 40

hostPanel : Panel
hostPanel =
    { name = "host"
    , class = "host"
    , icon = Assets.Svg.host
    , iconSize = 64
    , inactiveColor = Theme.dark
    , activeColor = Theme.pink
    , inactiveItemColor = Theme.dimWhite
    , activeItemColor = Theme.dimBlack
    }


watchPanel : Panel
watchPanel =
    { name = "watch"
    , class = "watch"
    , icon = Assets.Svg.watch
    , iconSize = 72
    , inactiveColor = Theme.dark
    , activeColor = Theme.pink
    , inactiveItemColor = Theme.dimWhite
    , activeItemColor = Theme.dimBlack
    }


viewPanel : Panel -> List (Html Msg) -> Html Msg
viewPanel panel contents =
    div
        [ classList
            [ ("panel", True)
            , (panel.class, True)
            ]
        , css
            [ displayFlex
            , flexDirection column
            , flexGrow (num 1)
            , flexBasis (px 0)
            , justifyContent center
            , alignItems center
            , backgroundColor Theme.dark
            , paddingBottom (pct 10)
            , transition
                [ backgroundColorTransition
                ]
            , hover
                [ backgroundColor panel.activeColor
                -- not supported by elm-css scoped, must use global
                , Css.Global.children
                    [ Css.Global.class (titleClass panel.class)
                        [ color <| panel.activeItemColor
                        ]
                    , Css.Global.svg
                        [ Css.Global.withClass (iconClass panel.class)
                            [ fill panel.activeItemColor
                            ]
                        ]
                    ]
                ]
            ]
        ]
        ([ h2
            [ class (titleClass panel.class)
            , css
                [ marginBottom (px 30)
                , textTransform uppercase
                , fontFamilies Font.josefin
                , fontWeight (int 600)
                , fontSize (rem 5)
                , color panel.inactiveItemColor
                , transition
                    [ colorTransition
                    ]
                ]
            ]
            [ text panel.name ]
        , panel.icon
            [ Svg.Styled.Attributes.class
                <| (iconClass panel.class) ++ " " ++ "svg-fill-transition"
            -- Must make sure to use Svg.Styled instead of Html.Styled package
            , Svg.Styled.Attributes.css
                [ Css.height (px <| toFloat panel.iconSize)
                , Css.width (px <| toFloat panel.iconSize)
                , fill panel.inactiveItemColor
                ]
            ]
        ] ++ contents)


titleClass : String -> String
titleClass panelClass =
    panelClass ++ "-title"


iconClass : String -> String
iconClass panelClass =
    panelClass ++ "-icon"


backgroundColorTransition : Transition
backgroundColorTransition =
    Css.Transitions.backgroundColor3 transitionLength 0 easeInOut


colorTransition : Transition
colorTransition =
    Css.Transitions.color3 transitionLength 0 easeInOut


{--
    Length of the transitions for the home page.

    For the time being (until elm-css supports svg fill transitions), the value
    must also be changed in the 'index.html' template
--}
transitionLength : Float
transitionLength =
    300
