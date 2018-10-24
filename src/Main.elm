import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url

-- Main --

main : Program () Model Msg
main =
  Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = UrlChanged
    , onUrlRequest = LinkClicked
    }


-- Model


type alias Model =
  { key : Nav.Key
  , url : Url.Url
  }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
  ( Model key url, Cmd.none )


-- Messages


type Msg
  = LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url


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
      [ text "The current url is: "
      , b [] [ text (Url.toString model.url) ]
      , ul []
        [ viewLink "/home"
        , viewLink "/profile"
        , viewLink "/test/path"
        ]
      ]
  }


viewLink : String -> Html Msg
viewLink path =
  li [] [ a [ href path ] [ text path ] ]


-- Nav

type UrlRequest
  = Internal Url.Url
  | External String
