module Message exposing (Msg(..))

import Browser
import Url
import Nav exposing (FooterRoute)


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | ChangeFooterRoute FooterRoute
