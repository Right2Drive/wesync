module Page.Home exposing (view)

import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (onClick)
import Message exposing (Msg(..))
import Model exposing (Model)


view : Model -> Html Msg
view model =
    div [] [ text "home" ]
