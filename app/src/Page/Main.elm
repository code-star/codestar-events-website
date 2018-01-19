module Main exposing (..)

--import Html.Events exposing (onClick, onInput)
--import Material.Chip as Chip exposing (..)
--import Material.Color as Color
--import Material.Menu as Menu exposing (render) -- test

import DiceRoller.State exposing (initialDiceRoller)
import DiceRoller.Types exposing (DiceRoller)
import DiceRoller.Update exposing (updateDiceRoller, updateDiceRollerCmd)
import DiceRoller.View exposing (viewDiceRoller)
import Html exposing (Html, a, br, div, h1, h2, h4, h5, iframe, img, input, p, program, section, text)
import Html.Attributes exposing (..)
import Material
import Material.Button as Button
import Material.Card as Card exposing (..)
import Material.Grid exposing (Device(..), cell, grid, size)
import Material.Options as Options exposing (Style, cs, css)
import Page.Assets exposing (..)
import Page.Msg as Main exposing (..)
import TwitterFeed.State exposing (TwitterFeedMsg)
import TwitterFeed.Types
import TwitterFeed.Update exposing (initTwitterFeedCmd, updateTwitterFeedModel)
import TwitterFeed.View


-- MAIN


main : Program Never Model Msg
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
    , diceRoller : DiceRoller
    , twitterFeed : TwitterFeed.Types.Model
    }


init : ( Model, Cmd Msg )
init =
    --( Model "Elm" Material.model initialDiceRoller, Cmd.none )
    ( Model "Elm" Material.model initialDiceRoller TwitterFeed.State.initialModel, initCmd )



-- UPDATE


initCmd : Cmd Msg
initCmd =
    initTwitterFeedCmd
        |> Cmd.map MsgForTwitterFeed


updateCmd : Msg -> Model -> Cmd Msg
updateCmd msg model =
    Cmd.batch
        [ updateDiceRollerCmd msg
        ]


updateModel : Msg -> Model -> Model
updateModel msg model =
    case msg of
        Mdl msg_ ->
            -- Material.update Mdl msg_ model
            model

        Name name ->
            { model | name = name }

        MsgForDiceRoller msg ->
            { model | diceRoller = updateDiceRoller msg model.diceRoller }

        MsgForTwitterFeed msg ->
            { model | twitterFeed = updateTwitterFeedModel msg model.twitterFeed }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( updateModel msg model, updateCmd msg model )



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
            [ a [ href "https://www.codestar.nl/" ]
                [ img
                    [ src <| Page.Assets.path <| Page.Assets.logo
                    , class "logo"
                    ]
                    []
                ]
            , h2 []
                [ a
                    [ href "#"
                    , class "active"
                    ]
                    [ Html.text "Events test" ]
                ]
            , h2 []
                [ a [ href "#" ]
                    [ Html.text "Photos" ]
                ]
            , h2 []
                [ a [ href "#" ]
                    [ Html.text "Articles" ]
                ]
            , h2 []
                [ a [ href "#" ]
                    [ Html.text "About" ]
                ]
            , h2 [] [ Html.text "[Social Media icons]" ]
            , a [ href "https://www.codestar.nl/#join", class "jobs-link" ]
                [ Html.text "We're hiring!" ]
            ]
        , section
            [ style
                [ ( "background", "rgba(0,0,0,0.5)" )
                , ( "margin-top", "6em" ) ------
                ]
            ]
            [ viewDiceRoller model.diceRoller
            ]
        , grid []
              [ cell [ Material.Grid.offset Desktop 3, Material.Grid.size Desktop 6, Material.Grid.size Tablet 10, Material.Grid.size Phone 12 ]
                  [ Card.view
                      [ css "width" "100%"
                      ]
                      [ Card.text [] [ TwitterFeed.View.view model.twitterFeed ] ]
                  ]
              ]
        , viewLandingPage model
        , eventsPage model "#0C4D90"
        , viewDifferencePage model
        , viewJobsPage model
        ]


viewLandingPage : Model -> Html Msg
viewLandingPage model =
    section
        [ class "page landing-page" ]
        [ grid []
            [ cell [ Material.Grid.offset Desktop 3, Material.Grid.size Desktop 6, Material.Grid.size Tablet 10, Material.Grid.size Phone 12 ]
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
                            [ Html.text "September 28, 2017" ]
                        ]
                    , Card.text []
                        [ Html.text "Codestar invites you to an evening with Andre Staltz, a renowned expert on reactive programming and author/contributor to frameworks like Cycle.js and RxJS. He will enlighten us with two brand new and unique talks about functional and reactive programming respectively, tailored to full-stack developers that have experience with working with reactive streams. " ]
                    , Card.actions
                        [ Card.border ]
                        [ Button.render Mdl
                            [ 1, 0 ]
                            model.mdl
                            [ Button.ripple
                            , Button.raised
                            , Button.colored
                            , Button.link "https://www.meetup.com/Code-Star-Night/events/242404035/"
                            ]
                            [ Html.text "Attend" ]
                        , Button.render Mdl
                            [ 1, 1 ]
                            model.mdl
                            [ Button.ripple
                            , Button.link "#events"
                            ]
                            [ Html.text "Read more" ]

                        -- https://www.meetup.com/Code-Star-Night/events/242404035/
                        ]
                    ]
                ]
            ]
        ]


eventsPage : Model -> String -> Html Msg
eventsPage model color =
    section
        [ class "page events-page"
        , id "events"
        ]
        [ grid []
            [ cell [ Material.Grid.offset Desktop 3, Material.Grid.offset Tablet 1, Material.Grid.size Desktop 6, Material.Grid.size Tablet 10 ]
                [ iframe
                    [ src "https://www.youtube.com/embed/LMtqXQkqTnM"
                    , width 300
                    , height 350
                    ]
                    []
                , p [] [ Html.text "Codestar invites you to an evening with Andre Staltz, a renowned expert on reactive programming and author/contributor to frameworks like Cycle.js and RxJS. He will enlighten us with two brand new and unique talks about functional and reactive programming respectively, tailored to full-stack developers that have experience with working with reactive streams." ]
                , h5 [] [ Html.text "Talk 1: OOP is dead only if FP is dead" ]
                , p [] [ Html.text "If you are looking for the most epic of flame wars, look no further than the threads discussing the differences between object-oriented programming (OOP) and functional programming (FP). Especially proponents of functional programming are known for some pretty smug remarks:" ]
                , p [] [ Html.text "'If you knew category theory, you'd get it!'" ]
                , p [] [ Html.text "'Design patterns in Haskell? Hey everyone, look at the muggle try to get the wand to work!'" ]
                , p [] [ Html.text "But is functional programming really in direct opposition to object-oriented programming? Although these two programming paradigms have important differences, they actually share a lot in common." ]
                , p [] [ Html.text "In this talk, Andre will explore the gray area between OOP and FP, with code samples in JavaScript, TypeScript, and Haskell, kept easy enough for any programmer to follow and none of the smugness you’ll find online!" ]
                , h5 [] [ Html.text "Talk 2: Live Coding - Two fundamental abstractions" ]
                , p [] [ Html.text "Getters and setters are a natural abstraction in any programming environment. But a talk about those would hardly be interesting. Instead, we will take these familiar and fundamental concepts and take them to the next level. We will discuss how “getter getters” are useful, how “setter setters” are useful, and specially how 'setter setters' are just simple RxJS Observables." ]
                , p [] [ Html.text "We will also learn how these “higher order” getters and setters can serve as building blocks for other abstractions when you are working with reactive streams (independent of the language you are working in). Come and find out how these exciting new insights might benefit your code!" ]
                , Button.render Mdl
                    [ 0 ]
                    model.mdl
                    [ Button.ripple
                    , Button.raised
                    , Button.colored
                    , Button.link "https://www.meetup.com/Code-Star-Night/events/242404035/"
                    ]
                    [ Html.text "Attend to meetup" ]
                , h5 [] [ Html.text "BONUS: RxJS training 29th of September" ]
                , p [] [ Html.text "If you still haven't got enough of functional and reactive programming after these two captivating talks, we invite you to join us for a Friday packed to the brim with reactive, functional, and André Staltz. Sign up below!" ]
                , Button.render Mdl
                    [ 0 ]
                    model.mdl
                    [ Button.ripple
                    , Button.raised
                    , Button.colored
                    , Button.link "http://go.ordina.nl/l/83122/2017-08-14/7ykd4j#referrer=meetupcom"
                    ]
                    [ Html.text "Attend to training" ]
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
            [ cell [ Material.Grid.offset Desktop 3, Material.Grid.offset Tablet 1, Material.Grid.size Desktop 6, Material.Grid.size Tablet 10 ]
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
            [ cell [ Material.Grid.offset Desktop 3, Material.Grid.offset Tablet 1, Material.Grid.size Desktop 6, Material.Grid.size Tablet 10 ]
                [ h2 [] [ Html.text "TIJD OM DE VOLGENDE STAP TE ZETTEN" ]
                , p [] [ Html.text "IT is meer dan ooit de drager, bezorger en verrijker van je business. Zonder een excellente digitale infrastructuur loop je al snel achter. Data in overvloed, waar begin je? Als iemand je vroeger om water vroeg, pakte je een emmer en liep je naar de waterput. Tegenwoordig hebben we te maken met een waterval aan data. Succes met je emmer." ]
                , p [] [ Html.text "Gelukkig is niet alleen de hoeveelheid data gegroeid maar ook de technieken om ermee te werken. Het moderne internet, mobiel gebruik en ‘Internet of Things’ vraagt om meer. Bijwerken wij met Scala, Frontend en BigData technologieën aan moderne software waarmee je uitdagingen niet meer uit de weg hoeft te gaan. Of je nu een grotere emmer, meer emmers of gewoon een fatsoenlijke waterleiding nodig hebt, wij kunnen het voor je maken." ]
                ]
            ]
        ]
