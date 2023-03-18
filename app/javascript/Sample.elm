port module Sample exposing (main)

import Browser
import Html exposing (Html, button, div, h1, text)
import Html.Attributes exposing (disabled)
import Html.Events exposing (onClick)



-- PORTS


port quantityChanged : Int -> Cmd msg


port setQuantity : (Int -> msg) -> Sub msg



-- MODEL


type alias Model =
    { name : String
    , quantity : Int
    , apiRoot : String
    , books : List Book
    }


type alias Book =
    { id : Int
    , name : String
    , testament : String
    , created_at : String
    , updated_at : String
    }


type alias Flags =
    { name : String
    , api_root : String
    , quantity : Int
    , books : List Book
    }



-- INIT


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { name = flags.name
      , apiRoot = flags.api_root
      , quantity = flags.quantity
      , books = flags.books
      }
    , Cmd.none
    )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text <| "Product name '" ++ model.name ++ "' passed to Elm" ]
        , div [] [ text <| "Quantity: " ++ String.fromInt model.quantity ]
        , button [ onClick DecrementClicked, disabled <| model.quantity == 0 ] [ text "-" ]
        , button [ onClick IncrementClicked ] [ text "+" ]
        ]



-- MSG


type Msg
    = DecrementClicked
    | IncrementClicked
    | SetQuantity Int
    | None



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DecrementClicked ->
            updateQuantity model <| max 0 <| model.quantity - 1

        IncrementClicked ->
            updateQuantity model <| model.quantity + 1

        SetQuantity quantity ->
            updateQuantity model <| max 0 quantity

        _ ->
            ( model, Cmd.none )


updateQuantity : Model -> Int -> ( Model, Cmd Msg )
updateQuantity model quantity =
    ( { model | quantity = quantity }, quantityChanged quantity )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    setQuantity SetQuantity



-- MAIN


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
