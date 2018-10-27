module Page.VideoNotFound exposing (view)


import Html exposing (..)
import Html.Attributes exposing (..)
import Message exposing (Msg(..))
import Model exposing (Model)


view : Model -> String -> Html Msg
view model uuid =
    div [] [ text "video not found" ]
