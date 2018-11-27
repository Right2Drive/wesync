module Nav exposing (Route(..), UrlRequest(..), urlToRoute, urlToClass, urlToTitle)

import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, oneOf, parse, s, string, top)


type Route
    = Home FooterRoute
    | Host FooterRoute
    | Watch FooterRoute String
    | NotFound


type FooterRoute
    = About
    | Donations
    | Changelog
    | Closed


type UrlRequest
    = Internal Url
    | External String


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        -- Home
        [ Parser.map (Home Closed) top
        , Parser.map (Home About) (s "about")
        , Parser.map (Home Donations) (s "donate")

        -- Host
        , Parser.map (Host Closed) (s "host")
        , Parser.map (Host About) (s "host" </> s "about")
        , Parser.map (Host Donations) (s "host" </> s "donate")
        , Parser.map (Host Changelog) (s "host" </> s "changelog")

        -- Peer
        , Parser.map (Watch Closed) (s "watch" </> string)
        , Parser.map (Watch About) (s "watch" </> string </> s "about")
        , Parser.map (Watch Donations) (s "watch" </> string </> s "donate")
        , Parser.map (Watch Changelog) (s "watch" </> string </> s "changelog")

        -- Peer (Stripped UUID)
        , Parser.map (Watch Closed "") (s "watch")
        , Parser.map (Watch About "") (s "watch" </> s "about")
        , Parser.map (Watch Donations "") (s "watch" </> s "donate")
        , Parser.map (Watch Changelog "") (s "watch" </> s "changelog")
        ]


donationsPath : String
donationsPath =
    "donate"


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
        Home footerRoute ->
            getRouteNameWithFooter "Home" footerRoute

        Host footerRoute ->
            getRouteNameWithFooter "Host" footerRoute

        Watch footerRoute _ ->
            getRouteNameWithFooter "Watch" footerRoute

        NotFound ->
            "404"


getRouteNameWithFooter : String -> FooterRoute -> String
getRouteNameWithFooter routeName footerRoute =
    case footerRoute of
        About ->
            "About"

        Donations ->
            "Donations"

        Changelog ->
            "Changelog"

        Closed ->
            routeName


footerRouteToName : FooterRoute -> String
footerRouteToName route =
    case route of
        Closed ->
            ""

        About ->
            "About"

        Donations ->
            "Donations"

        Changelog ->
            "Changelog"


routeToClass : Route -> String
routeToClass route =
    case route of
        Home _ ->
            "home"

        Watch _ _ ->
            "watch video"

        Host _ ->
            "host video"

        NotFound ->
            "not-found"


footerRouteToClass : FooterRoute -> String
footerRouteToClass route =
    case route of
        About ->
            "about"

        Donations ->
            "donations"

        Changelog ->
            "changelog"

        Closed ->
            "shown"


routeToString : Route -> String
routeToString route =
    case route of
        Home footerRoute ->
            footerRouteToString footerRoute

        Watch footerRoute "" ->
            "/watch" ++ footerRouteToString footerRoute

        Watch footerRoute uuid ->
            "/watch/" ++ uuid ++ footerRouteToString footerRoute

        Host footerRoute ->
            "/host" ++ footerRouteToString footerRoute

        NotFound ->
            "404"


footerRouteToString : FooterRoute -> String
footerRouteToString route =
    case route of
        About ->
            "/about"

        Donations ->
            "/donations"

        Changelog ->
            "/changelog"

        Closed ->
            "/"


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
