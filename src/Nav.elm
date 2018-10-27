module Nav exposing (Route(..), UrlRequest(..), urlToTitle, toRoute)


import Url exposing (Url)
import Url.Parser as Parser exposing (Parser, parse, oneOf, s, top, string, (</>))


type Route
    = Home
    | About
    | Donations
    | Video String
    | VideoNotFound String
    | NotFound


type UrlRequest
    = Internal Url
    | External String


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ Parser.map Home top
        , Parser.map Video (s "watch" </> string)
        , Parser.map (VideoNotFound "") (s "nohost")
        , Parser.map VideoNotFound (s "nohost" </> string)
        , Parser.map About (s "about")
        , Parser.map Donations (s "donations")
        ]


toRoute : String -> Route
toRoute str =
    case Url.fromString str of
        
        Nothing ->
            NotFound

        Just url ->
            Maybe.withDefault NotFound <|
                parse routeParser url


routeToName : Route -> String
routeToName route =
    case route of

        Home -> "Home"

        Video _ -> "Watch"

        About -> "About"

        Donations -> "Donations"

        VideoNotFound _ -> "No Host"

        NotFound -> "404"


routeToString : Route -> String
routeToString route =
    case route of

        Home ->
            "/"

        Video uuid ->
            "/watch/" ++ uuid

        About ->
            "/about"

        Donations ->
            "/donations"

        VideoNotFound uuid ->
            "/nohost/" ++ uuid

        NotFound ->
            "404"


urlToTitle : Url -> String
urlToTitle url =
    let
        routeName =
            url
                |> Url.toString
                |> toRoute
                |> routeToName


    in
        "WeSync Video | " ++ routeName
