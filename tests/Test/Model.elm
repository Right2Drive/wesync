module Test.Model exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)
import Model exposing (defaultCache)


suite : Test
suite =
    describe "Model"
        [ describe "Cache"
            [ describe "default"
                [ test "version is 0.0.1" <|
                    \_ ->
                        Expect.equal defaultCache.version "0.0.1"
                ]
            ]
        ]
