# elm-multiline-string

[![test](https://github.com/arowM/elm-multiline-string/actions/workflows/test.yaml/badge.svg)](https://github.com/arowM/elm-multiline-string/actions/workflows/test.yaml) [![Elm package](https://img.shields.io/elm-package/v/arowM/elm-multiline-string)](https://package.elm-lang.org/packages/arowM/elm-multiline-string/latest/)

Tiny library to solve multiline string indentation problems.

```elm
import String.Multiline exposing (here)

conventional : String
conventional =
    let
        part = """This multiline string
breaks indents..."""
    in
    part


conventional2 : String
conventional2 =
    let
        part =
            """
            This multiline string
            has unexpected 12 spaces and newlines. 😢
            """
    in
    part

conventional2
--> "\n            This multiline string\n            has unexpected 12 spaces and newlines. 😢\n            "


cool : String
cool =
    let
        part =
            here """
            This multiline string does not
            have unexpected spaces and newlines.
            """
    in
    part

cool
--> "This multiline string does not\nhave unexpected spaces and newlines."


cool2 : String
cool2 =
    let
        part =
            here """
                This line is indented.
            This line is not.
                This line is also indented.
            """
    in
    part

cool2
--> "    This line is indented.\nThis line is not.\n    This line is also indented."
```
