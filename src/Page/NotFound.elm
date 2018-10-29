module Page.NotFound exposing (view)

import Html
import Html.Styled exposing (..)
import Message exposing (Msg(..))
import Model exposing (Model)


view : Model -> List (Html Msg)
view model =
    [ div [] [ text "not found page" ]
    ]
