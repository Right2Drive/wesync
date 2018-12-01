module Style.Media exposing (mobile, desktop)


import Css.Media as M exposing (only, screen)
import Css exposing (px)


mobile : List Css.Style -> Css.Style
mobile =
    M.withMedia
        [ only screen [ M.maxWidth (px 700) ] ]
        


desktop : List Css.Style -> Css.Style
desktop =
    M.withMedia
        [ only screen [ M.minWidth (px 701) ] ]
