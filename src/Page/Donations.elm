module Page.Donations exposing (view)

import Html
import Html.Styled exposing (..)
import Message exposing (Msg(..))
import Model exposing (Model)


view : Model -> Html Msg
view model =
    a [] []
