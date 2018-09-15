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
    { people =
        [ "Person 1"
        , "Person 2"
        ]
    }


update : msg -> Model -> Model
update msg model =
    model


view : Model -> Html msg
view model =
    Html.div []
        [ Html.ul []
            (List.map renderItem model.people)
        , Html.text "Hello world!"
        ]


renderItem : String -> Html msg
renderItem item =
    Html.li [] [ Html.text item ]
