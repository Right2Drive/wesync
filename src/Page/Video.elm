module Page.Video exposing (view)

import Html
import Html.Styled exposing (..)
import Message exposing (Msg(..))
import Model exposing (Model)


view : Model -> String -> Html Msg
view model uuid =
    div []
        [ h1 [] [ text "Video Page" ]
        , p [] [ text ("uuid: " ++ uuid) ]
        ]
