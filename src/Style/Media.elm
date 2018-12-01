module Style.Media exposing (desktop, mobile)

import Css exposing (px)
import Css.Media as M exposing (only, screen)


mobile : List Css.Style -> Css.Style
mobile =
    M.withMedia
        [ only screen [ M.maxWidth (px 700) ] ]


desktop : List Css.Style -> Css.Style
desktop =
    M.withMedia
        [ only screen [ M.minWidth (px 701) ] ]
