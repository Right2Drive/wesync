import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url
import Port
import Json.Decode as D
import Model exposing (Model, defaultModel)
-- TODO: How to only import specific messages
-- TODO: How to use Msg.Example namespacing
import Message exposing (Msg(..))
import Flag


-- Main --


main : Program D.Value Model Msg
main =
  Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = UrlChanged
    , onUrlRequest = LinkClicked
    }




init : D.Value -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
  let
      cache =
        Flag.initCache flags

  in
    ( defaultModel url key cache
    , Port.sendCache cache
    )


-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    
    LinkClicked urlRequest ->
      case urlRequest of

        Browser.Internal url ->
          ( model, Nav.pushUrl model.key (Url.toString url) )

        Browser.External href ->
          ( model, Nav.load href )

    UrlChanged url ->
      ( { model | url = url }
      , Cmd.none
      )


-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none


-- View


view : Model -> Browser.Document Msg
view model =
  { title = "WeSync Video"
  , body =
      [ viewCache model
      , text "The current url is: "
      , b [] [ text (Url.toString model.url) ]
      , ul []
        [ viewLink "/home"
        , viewLink "/profile"
        , viewLink "/test/path"
        ]
      ]
  }


viewCache : Model -> Html msg
viewCache model =
  p [] [ text model.cache.version ]


viewLink : String -> Html Msg
viewLink path =
  li [] [ a [ href path ] [ text path ] ]


-- Nav

type UrlRequest
  = Internal Url.Url
  | External String
