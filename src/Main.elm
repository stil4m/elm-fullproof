module Main exposing (main)

import Browser
import Html


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


init =
    { people = [] }


update msg model =
    model


view model =
    Html.div []
        [ Html.text "Hello world!" ]
