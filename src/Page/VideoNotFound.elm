module Page.VideoNotFound exposing (view)

import Html
import Html.Attributes exposing (..)
import Html.Styled exposing (..)
import Message exposing (Msg(..))
import Model exposing (Model)


view : Model -> String -> Html Msg
view model uuid =
    div [] [ text "video not found" ]
