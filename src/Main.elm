module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Attributes
import Html.Events


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Person =
    String


type alias Model =
    { people : List Person
    , newValue : String
    }


type Msg
    = SetNewValue String
    | Submit


init : Model
init =
    { people =
        [ "Person 1"
        , "Person 2"
        ]
    , newValue = ""
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        SetNewValue string ->
            { model | newValue = string }

        Submit ->
            if String.isEmpty model.newValue then
                model

            else
                { model
                    | people = model.newValue :: model.people
                    , newValue = ""
                }


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.ul []
            (List.map renderItem model.people)
        , Html.form [ Html.Events.onSubmit Submit ]
            [ Html.input
                [ Html.Attributes.type_ "text"
                , Html.Events.onInput SetNewValue
                ]
                []
            ]
        ]


renderItem : String -> Html msg
renderItem item =
    Html.li [] [ Html.text item ]
