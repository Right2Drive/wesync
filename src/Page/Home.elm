module Page.Home exposing (view)

import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (onClick)
import Svg.Styled
import Svg.Styled.Attributes
import Css exposing (..)
import Css.Global
import Css.Transitions exposing (Transition, TimingFunction, transition, easeInOut)
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
    [ viewPanel hostPanel
        []
    , viewPanel watchPanel
        []
    ]


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
            , hover
                [ backgroundColor panel.activeColor
                -- Unfortunately must either use Css.Global here, or add
                -- hover state to model (not performant)
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
        [ h2
            [ class (titleClass panel.class)
            , css
                [ marginBottom (px 30)
                , textTransform uppercase
                , fontFamilies Font.josefin
                , fontWeight (int 600)
                , fontSize (rem 5)
                , color panel.inactiveItemColor
                ]
            ]
            [ text panel.name ]
        , panel.icon
            [ Svg.Styled.Attributes.class (iconClass panel.class)
            -- Must make sure to use Svg.Styled instead of Html.Styled package
            , Svg.Styled.Attributes.css
                [ Css.height (px <| toFloat panel.iconSize)
                , Css.width (px <| toFloat panel.iconSize)
                , fill Theme.white
                ]
            ]
        ]


titleClass : String -> String
titleClass panelClass =
    panelClass ++ "-title"


iconClass : String -> String
iconClass panelClass =
    panelClass ++ "-icon"


baseTransition : (Float -> Float -> TimingFunction -> Transition) -> Transition
baseTransition transitionTarget =
    transitionTarget 0.5 0 easeInOut


iconTransition : Transition
iconTransition =
    -- TODO: Probably need to change to target all
    baseTransition Css.Transitions.fill
