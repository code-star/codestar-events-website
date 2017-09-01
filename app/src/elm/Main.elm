module Main exposing (..)

import Html exposing (Html, br, div, h1, h2, h4, img, input, p, program, section, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Material
import Material.Color as Color
import Material.Button as Button
import Material.Grid exposing (Device(..), cell, grid, size)
import Material.Options as Options exposing (Style, cs, css)
import Material.Menu as Menu exposing (render)
import Material.Card as Card exposing (..)
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

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Mdl msg_ ->
            -- Material.update Mdl msg_ model
            ( model, Cmd.none )

        Name name ->
            ( { model | name = name }, Cmd.none )


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- VIEW


view : Model -> Html Msg
view model =
    div
        [ class "codestar-page-wrapper" ]
        [ div
            [ class "header" ]
            [ img
                [ src "img/codestar-logo.svg"
                , class "logo"
                ]
                []
            , h2 [] [ Html.text "Events & More" ]
            ]
            , viewLandingPage model
            , viewDummyPage model "green"
            , viewDummyPage model "papayawhip"
            , viewDifferencePage model
            , viewJobsPage model
        ]


viewLandingPage : Model -> Html Msg
viewLandingPage model =
    section
        [ class "landing-page" ]
        [ grid []
            [ cell [ Material.Grid.offset All 3, Material.Grid.size All 6 ]
                [ Card.view
                    [ css "width" "100%"
                    ]
                    [ Card.title
                        [ css "background" "url('https://secure.meetupstatic.com/photos/event/8/a/9/600_463562217.jpeg') center / cover"
                        , css "height" "256px"
                        , css "padding" "0" -- Clear default padding to encompass scrim
                        ]
                        [ Card.head
                            [ Options.scrim 0.75
                            , css "padding" "16px" -- Restore default padding inside scrim
                            , css "width" "100%"
                            , css "color" "rgb(240,131,0)"
                            ]
                            [ Html.text "Coming up..." ]
                        ]
                    , Card.text []
                        [ Html.text "Codestar invites you to an evening with Andre Staltz, a renowned expert on reactive programming and author/contributor to frameworks like Cycle.js and RxJS. He will enlighten us with two brand new and unique talks about functional and reactive programming respectively, tailored to full-stack developers that have experience with working with reactive streams. " ]
                    , Card.actions
                        [ Card.border ]
                        [ Button.render Mdl [1,0] model.mdl
                            [ Button.ripple, Button.accent ]
                            [ Html.text "Attend" ] -- https://www.meetup.com/Code-Star-Night/events/242404035/
                        , Button.render Mdl [1,1] model.mdl
                            [ Button.ripple, Button.accent ]
                            [ Html.text "Read more" ] -- https://www.meetup.com/Code-Star-Night/events/242404035/
                        ]
                    ]
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
                , p [] [ Html.text "De mogelijkheden in de digitale wereld zijn eindeloos. Uitdagingen vaak complex. Wij ontwikkelen moderne software die simpel te gebruiken is. Agile en productief, met gebruik van de nieuwste technieken. Wij programmeren. Met ons hoofd én met ons hart. Voor organisaties die de volgende stap willen zetten." ]
                , p [] [ Html.text "Wij zijn de #1 partner voor Full Stack Scala en Big Data oplossingen in Nederland. Wij zijn Codestar." ]
                , Button.render Mdl
                    [ 0 ]
                    model.mdl
                    [ Button.raised ]
                    [ Html.text "Menu NYI" ]
                ]
            ]
        ]


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
                [ h2 [] [ Html.text "TIJD OM DE VOLGENDE STAP TE ZETTEN" ]
                , p [] [ Html.text "IT is meer dan ooit de drager, bezorger en verrijker van je business. Zonder een excellente digitale infrastructuur loop je al snel achter. Data in overvloed, waar begin je? Als iemand je vroeger om water vroeg, pakte je een emmer en liep je naar de waterput. Tegenwoordig hebben we te maken met een waterval aan data. Succes met je emmer." ]
                , p [] [ Html.text "Gelukkig is niet alleen de hoeveelheid data gegroeid maar ook de technieken om ermee te werken. Het moderne internet, mobiel gebruik en ‘Internet of Things’ vraagt om meer. Bijwerken wij met Scala, Frontend en BigData technologieën aan moderne software waarmee je uitdagingen niet meer uit de weg hoeft te gaan. Of je nu een grotere emmer, meer emmers of gewoon een fatsoenlijke waterleiding nodig hebt, wij kunnen het voor je maken." ]
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
                [ h2 [] [ Html.text "TIJD OM DE VOLGENDE STAP TE ZETTEN" ]
                , p [] [ Html.text "IT is meer dan ooit de drager, bezorger en verrijker van je business. Zonder een excellente digitale infrastructuur loop je al snel achter. Data in overvloed, waar begin je? Als iemand je vroeger om water vroeg, pakte je een emmer en liep je naar de waterput. Tegenwoordig hebben we te maken met een waterval aan data. Succes met je emmer." ]
                , p [] [ Html.text "Gelukkig is niet alleen de hoeveelheid data gegroeid maar ook de technieken om ermee te werken. Het moderne internet, mobiel gebruik en ‘Internet of Things’ vraagt om meer. Bijwerken wij met Scala, Frontend en BigData technologieën aan moderne software waarmee je uitdagingen niet meer uit de weg hoeft te gaan. Of je nu een grotere emmer, meer emmers of gewoon een fatsoenlijke waterleiding nodig hebt, wij kunnen het voor je maken." ]
                ]
            ]
        ]
