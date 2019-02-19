module Page.Home exposing (view)

import Assets.Svg
import Css exposing (..)
import Css.Global
import Css.Transitions exposing (Transition, easeInOut, transition)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (onClick)
import Message exposing (Msg(..))
import Model exposing (Model)
import Style.Font as Font
import Style.Media as Media
import Style.Theme as Theme
import Svg.Styled
import Svg.Styled.Attributes


type alias Panel =
    { name : String
    , class : String
    , icon : List (Svg.Styled.Attribute Msg) -> Html Msg
    , iconSize : Int
    , inactiveColor : Color
    , activeColor : Color
    , inactiveItemColor : Color
    , activeItemColor : Color
    , phoneColor : Color
    , phoneItemColor : Color
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
            , Media.mobile
                [ flexDirection column
                ]
            ]
        ]
        [ viewPanel hostPanel
            []
        , viewPanel watchPanel
            []
        ]
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
    , phoneColor = Theme.pink
    , phoneItemColor = Theme.dimBlack
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
    , phoneColor = Theme.dark
    , phoneItemColor = Theme.dimWhite
    }


viewPanel : Panel -> List (Html Msg) -> Html Msg
viewPanel panel contents =
    div
        [ classList
            [ ( "panel", True )
            , ( panel.class, True )
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
            , Media.desktop
                [ hover
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
            , Media.mobile
                [ backgroundColor panel.phoneColor
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
                , Media.mobile
                    [ color panel.phoneItemColor
                    , marginBottom (px 20)
                    , fontSize (rem 3)
                    ]
                ]
            ]
            [ text panel.name ]
         , panel.icon
            [ Svg.Styled.Attributes.class <|
                iconClass panel.class
                    ++ " "
                    ++ "svg-fill-transition"

            -- Must make sure to use Svg.Styled instead of Html.Styled package
            , Svg.Styled.Attributes.css
                [ Css.height (px <| toFloat panel.iconSize)
                , Css.width (px <| toFloat panel.iconSize)
                , fill panel.inactiveItemColor
                , Media.mobile
                    [ fill panel.phoneItemColor
                    , Css.height (px <| toFloat <| panel.iconSize * 3 // 4)
                    , Css.width (px <| toFloat <| panel.iconSize * 3 // 4)
                    ]
                ]
            ]
         ]
            ++ contents
        )


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
