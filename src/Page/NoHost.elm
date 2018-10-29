module Page.NoHost exposing (view)

import Html
import Html.Attributes exposing (..)
import Html.Styled exposing (..)
import Message exposing (Msg(..))
import Model exposing (Model)


view : Model -> String -> List (Html Msg)
view model uuid =
    []
