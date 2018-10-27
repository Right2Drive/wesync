module Page.NotFound exposing (view)


import Html exposing (..)
import Model exposing (Model)
import Message exposing (Msg(..))


view : Model -> Html Msg
view model =
    div [] [ text "not found page" ]
