module Assets exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Page.Assets exposing (..)
import Test exposing (..)


suite : Test
suite =
    --t-odo "Implement our first test. See http://package.elm-lang.org/packages/elm-community/elm-test/latest for how to do this!"
    describe "My first Elm test"
        [ describe "Assets module"
            [ test "a string should be equal to itself (an example)" <|
                \_ ->
                    let
                        foo =
                            "foobar"
                    in
                    Expect.equal "foobar" foo
            , test "the logo path should have a specific value" <|
                \_ ->
                    let
                        expectedPath =
                            "../../assets/img/codestar-logo-notext.svg"
                    in
                    Expect.equal expectedPath (Page.Assets.path Page.Assets.logo)
            , test "the logo path should have a specific value (testing other syntax)" <|
                \_ ->
                    let
                        expectedPath =
                            "../../assets/img/codestar-logo-notext.svg"
                    in
                    Expect.equal expectedPath <| Page.Assets.path <| Page.Assets.logo
            ]
        ]
