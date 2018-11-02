module Page.Home exposing (view)

import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (onClick)
import Svg.Styled
import Svg.Styled.Attributes
import Css exposing (..)
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
    }


watchPanel : Panel
watchPanel =
    { name = "watch"
    , class = "watch"
    , icon = Assets.Svg.watch
    , iconSize = 72
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
            ]
        ]
        [ h2
            [ css
                [ marginBottom (px 30)
                , textTransform uppercase
                , fontFamilies Font.josefin
                , fontWeight (int 600)
                , fontSize (rem 5)
                , color Theme.dimWhite
                ]
            ]
            [ text panel.name ]
        , panel.icon
            -- Must make sure to use Svg.Styled instead of Html.Styled package
            [ Svg.Styled.Attributes.css
                [ Css.height (px <| toFloat panel.iconSize)
                , Css.width (px <| toFloat panel.iconSize)
                , fill Theme.white
                ]
            ]
        ]
