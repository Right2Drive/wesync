module Message exposing (Msg(..))

import Browser
import Url


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
