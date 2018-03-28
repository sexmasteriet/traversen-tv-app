port module Main exposing (..)

import Html exposing (Html, button, div, text, p, h1)
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model =
  { greet : String
  , number : Int
  }

model : Model
model = Model "Hej" 0


-- UPDATE

type Msg 
  = Greet String
  | Increment
  | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Greet greeting ->
      { model | greet = greeting }

    Increment ->
      { model | number = model.number + 1}

    Decrement ->
      { model | number = model.number - 1}


-- SUBSCRIPTIONS

port greet : (String -> msg) -> Sub msg

subscriptions : Model -> Sub Msg
subscriptions model =
    greet Greet


-- VIEW

view model =
  div []
    [ h1 [] [ text model.greet ]
    , p [] [ text "Electron app running on this machine." ]
    , button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model.number) ]
    , button [ onClick Increment ] [ text "+" ]
    ]