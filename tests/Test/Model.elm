module Test.Model exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Model exposing (defaultCache)
import Test exposing (..)


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
