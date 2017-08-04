module Main exposing (..)

import GithubBanner.View exposing (..)
import Html exposing (Html, br, div, h2, h4, img, input, p, program, section, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Material
import Material.Button as Button
import Material.Grid exposing (Device(..), cell, grid, size)
import Material.Options as Options exposing (Style)
import Msg as Main exposing (..)


-- MAIN


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { name : String
    , mdl : Material.Model
    }


init : ( Model, Cmd Msg )
init =
    ( Model "Elm" Material.model, Cmd.none )



--(   { name = "Elm"
--    , mdl = Material.Model
--    , infiniteScroll = InfiniteScroll.init loadMore
--    , content = initialContent
--    }, Cmd.none)
-- UPDATE
--updateCmd : Msg -> Model -> Cmd Msg
--updateCmd msg model =
--    Cmd.batch
--        []
-- button example: https://github.com/debois/elm-mdl/blob/master/demo/Demo/Buttons.elm
{- updateModel : Msg -> Model -> Model
   updateModel msg model =
       case msg of
           Mdl msg_ ->
               -- Material.update Mdl msg_ model
               model

           Name name ->
               { model | name = name }

           InfiniteScrollMsg msg_ ->
               let
                   four = Debug.log "Inf Scroll msg" 4
                   ( infiniteScroll, cmd ) =
                       InfiniteScroll.update InfiniteScrollMsg msg_ model.infiniteScroll
               in
                   { model | infiniteScroll = infiniteScroll }
           OnDataRetrieved (Err _) ->
               let
                   one = Debug.log "err" 1
                   -- Don't forget to handle error
                   infiniteScroll =
                       InfiniteScroll.stopLoading model.infiniteScroll
               in
                   { model | infiniteScroll = infiniteScroll }

           OnDataRetrieved (Ok result) ->
               let
                   two = Debug.log "OK" 2
                   content = addContent result model.content
                   infiniteScroll = InfiniteScroll.stopLoading model.infiniteScroll
               in
                   { model | content = content, infiniteScroll = infiniteScroll }
-}


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Mdl msg_ ->
            -- Material.update Mdl msg_ model
            ( model, Cmd.none )

        Name name ->
            ( { model | name = name }, Cmd.none )



--update : Msg -> Model -> ( Model, Cmd Msg )
--update msg model =
--    ( updateModel msg model, updateCmd msg model )
-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div
        [ style
            [ ( "background-color", "#0f569a" )
            , ( "color", "white" )
            , ( "height", "100vh" )
            ]
        ]
        [ viewGithubBanner
        , section
            [ style
                [ ( "text-align", "center" )
                , ( "height", "100vh" )
                , ( "display", "flex" )
                , ( "align-items", "center" )
                ]
            ]
            --[ input [ onInput Name, value model.name ] []
            --, br [] []
            --, text (String.reverse model.name)
            [ grid []
                --[ cell [ Material.Grid.size All 4 ]
                --    [ h4 [] [text "Cell 1"]
                --    ]
                --, cell [ Material.Grid.offset All 2, Material.Grid.size All 4 ]
                --    [ h4 [] [text "Cell 2"]
                --    , p [] [text "This cell is offset by 2"]
                --    ]
                --, cell [ Material.Grid.size All 6 ]
                --    [ h4 [] [text "Cell 3"]
                --    ]
                --, cell [ Material.Grid.size Tablet 6, Material.Grid.size Desktop 12, Material.Grid.size Phone 2 ]
                --    [ h4 [] [text "Cell 4"]
                --    , p [] [text "Size varies with device"]
                --    ]
                [ cell [ Material.Grid.offset All 3, Material.Grid.size All 6 ]
                    [ img
                        [ src "img/codestar-logo.svg"
                        , width 382
                        ]
                        []
                    , p [] [ text "De mogelijkheden in de digitale wereld zijn eindeloos. Uitdagingen vaak complex. Wij ontwikkelen moderne software die simpel te gebruiken is. Agile en productief, met gebruik van de nieuwste technieken. Wij programmeren. Met ons hoofd én met ons hart. Voor organisaties die de volgende stap willen zetten." ]
                    , p [] [ text "Wij zijn de #1 partner voor Full Stack Scala en Big Data oplossingen in Nederland. Wij zijn Codestar." ]
                    , Button.render Mdl
                        [ 0 ]
                        model.mdl
                        [ Button.raised

                        -- , Options.onClick MyClickMsg
                        ]
                        [ text "Menu NYI" ]
                    ]
                , cell
                    [ Material.Grid.offset All 3, Material.Grid.size All 6 ]
                    [ div [] [ text "some text" ]
                    ]
                ]
            ]
        ]
