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
        , viewLandingPage model

        --        , viewDummyPage model "green"
        --        , viewDummyPage model "papayawhip"
        , viewDifferencePage model
        , viewJobsPage model
        ]


viewLandingPage : Model -> Html Msg
viewLandingPage model =
    section
        [ style
            [ ( "text-align", "center" )
            , ( "height", "100vh" )
            , ( "display", "flex" )
            , ( "align-items", "center" )
            , ( "background", "linear-gradient(#0c4d90 0%, #1464af 100%)" )
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


viewDummyPage : Model -> String -> Html Msg
viewDummyPage model color =
    section
        [ style
            [ ( "text-align", "center" )
            , ( "height", "100vh" )
            , ( "display", "flex" )
            , ( "align-items", "center" )
            , ( "background-color", color )
            ]
        ]
        [ grid []
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
            ]
        ]



--let colors = ['#030815','#041b36','#052d57','#073b72','#0c4d90','#1464af','#2b7ec5','#4e9bd5','#7bb9e5','#aad6f4'];
--css.push('linear-gradient(to bottom, ' + colors[i] + ' 0%, ' + colors[i+1] + ' 100%)');
-- background gradients: List of pages and List of tuples of start/end colors with map to results in List of pages with gradients


viewJobsPage : Model -> Html Msg
viewJobsPage model =
    section
        [ style
            [ ( "text-align", "center" )
            , ( "height", "100vh" )
            , ( "display", "flex" )
            , ( "align-items", "center" )
            , ( "background", "linear-gradient(#030815 0%, #041b36 100%)" )
            ]
        ]
        [ grid []
            [ cell [ Material.Grid.offset All 3, Material.Grid.size All 6 ]
                [ h2 [] [ text "TIJD OM DE VOLGENDE STAP TE ZETTEN" ]
                , p [] [ text "IT is meer dan ooit de drager, bezorger en verrijker van je business. Zonder een excellente digitale infrastructuur loop je al snel achter. Data in overvloed, waar begin je? Als iemand je vroeger om water vroeg, pakte je een emmer en liep je naar de waterput. Tegenwoordig hebben we te maken met een waterval aan data. Succes met je emmer." ]
                , p [] [ text "Gelukkig is niet alleen de hoeveelheid data gegroeid maar ook de technieken om ermee te werken. Het moderne internet, mobiel gebruik en ‘Internet of Things’ vraagt om meer. Bijwerken wij met Scala, Frontend en BigData technologieën aan moderne software waarmee je uitdagingen niet meer uit de weg hoeft te gaan. Of je nu een grotere emmer, meer emmers of gewoon een fatsoenlijke waterleiding nodig hebt, wij kunnen het voor je maken." ]
                ]
            ]
        ]


viewDifferencePage : Model -> Html Msg
viewDifferencePage model =
    section
        [ style
            [ ( "text-align", "center" )
            , ( "height", "100vh" )
            , ( "display", "flex" )
            , ( "align-items", "center" )
            , ( "background", "linear-gradient(#1464af 0%, #2b7ec5 100%)" )
            ]
        ]
        [ grid []
            [ cell [ Material.Grid.offset All 3, Material.Grid.size All 6 ]
                [ h2 [] [ text "TIJD OM DE VOLGENDE STAP TE ZETTEN" ]
                , p [] [ text "IT is meer dan ooit de drager, bezorger en verrijker van je business. Zonder een excellente digitale infrastructuur loop je al snel achter. Data in overvloed, waar begin je? Als iemand je vroeger om water vroeg, pakte je een emmer en liep je naar de waterput. Tegenwoordig hebben we te maken met een waterval aan data. Succes met je emmer." ]
                , p [] [ text "Gelukkig is niet alleen de hoeveelheid data gegroeid maar ook de technieken om ermee te werken. Het moderne internet, mobiel gebruik en ‘Internet of Things’ vraagt om meer. Bijwerken wij met Scala, Frontend en BigData technologieën aan moderne software waarmee je uitdagingen niet meer uit de weg hoeft te gaan. Of je nu een grotere emmer, meer emmers of gewoon een fatsoenlijke waterleiding nodig hebt, wij kunnen het voor je maken." ]
                ]
            ]
        ]
