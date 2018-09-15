module Main exposing (main)

import Browser
import Html exposing (Html)


main : Program () Model msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Person =
    String


type alias Model =
    { people : List Person }


init : Model
init =
    { people = [] }


update : msg -> Model -> Model
update msg model =
    model


view : Model -> Html msg
view model =
    Html.div []
        [ Html.ul []
            [ renderItem "Person 1"
            , renderItem "Person 2"
            ]
        , Html.text "Hello world!"
        ]


renderItem : String -> Html msg
renderItem item =
    Html.li [] [ Html.text item ]
