module Message exposing (Msg(..))

import Browser
import Nav exposing (FooterRoute)
import Url


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | ChangeFooterRoute FooterRoute
