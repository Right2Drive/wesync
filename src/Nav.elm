module Nav exposing (Route(..), UrlRequest(..), toRoute, urlToClass, urlToTitle)

import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, oneOf, parse, s, string, top)


type Route
    = Home
    | About
    | Donations
    | Video String
    | NoHost String
    | NotFound


type UrlRequest
    = Internal Url
    | External String


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ Parser.map Home top
        , Parser.map Video (s "watch" </> string)
        , Parser.map (NoHost "") (s "nohost")
        , Parser.map NoHost (s "nohost" </> string)
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
        Home ->
            "Home"

        Video _ ->
            "Watch"

        About ->
            "About"

        Donations ->
            "Donations"

        NoHost _ ->
            "No Host"

        NotFound ->
            "404"


routeToClass : Route -> String
routeToClass route =
    case route of
        Home ->
            "home"

        Video _ ->
            "video"

        About ->
            "about"

        Donations ->
            "donations"

        NoHost _ ->
            "video-not-found"

        NotFound ->
            "not-found"


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

        NoHost uuid ->
            "/nohost/" ++ uuid

        NotFound ->
            "404"


urlToTitle : Url -> String
urlToTitle url =
    let
        routeName =
            url
                |> urlToRoute
                |> routeToName
    in
    "WeSync Video | " ++ routeName


urlToClass : Url -> String
urlToClass url =
    url
        |> urlToRoute
        |> routeToClass


urlToRoute : Url -> Route
urlToRoute url =
    url
        |> Url.toString
        |> toRoute
