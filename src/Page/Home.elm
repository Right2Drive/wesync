module Page.Home exposing (view)

import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (onClick)
import Css exposing (..)
import Message exposing (Msg(..))
import Model exposing (Model)
import Style.Theme as Theme
import Style.Font as Font


view : Model -> List (Html Msg)
view model =
    [ panel "host" "host" "/icons/host.svg"
        []
    , panel "watch" "watch" "/icons/watch.svg"
        []
    ]


panel : String -> String -> String -> List (Html Msg) -> Html Msg
panel name panelClass imgSrc contents =

    div
        [ classList
            [ ("panel", True)
            , (panelClass, True)
            ]
        , css
            [ displayFlex
            , flexDirection column
            , flexGrow (num 1)
            , flexBasis (px 0)
            , justifyContent center
            , alignItems center
            , backgroundColor Theme.dark
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
            [ text name ]
        , img
            [ src imgSrc
            , alt (name ++ " image")
            ]
            []
        ]
