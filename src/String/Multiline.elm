module String.Multiline exposing (here)

{-| Tiny module to solve multiline string indentation problems.

@docs here

-}


{-| -}
here : String -> String
here str =
    let
        formatted : List ( Int, String )
        formatted =
            String.lines str
                |> List.map reduceIndent

        minLevel =
            List.foldl
                (\( level, str_ ) n ->
                    if str_ == "" then
                        n

                    else if level < n then
                        level

                    else
                        n
                )
                2147483647
                formatted
    in
    List.map
        (\( level, str_ ) ->
            if str_ == "" then
                ""

            else
                String.repeat (level - minLevel) " " ++ str_
        )
        formatted
        |> String.join "\n"
        |> (\str_ ->
                if String.endsWith "\n" str_ then
                    String.dropRight 1 str_

                else
                    str_
           )
        |> (\str_ ->
                if String.startsWith "\n" str_ then
                    String.dropLeft 1 str_

                else
                    str_
           )


reduceIndent : String -> ( Int, String )
reduceIndent =
    let
        internal level str =
            case String.uncons str of
                Nothing ->
                    ( 0, "" )

                Just ( ' ', s ) ->
                    internal (level + 1) s

                Just _ ->
                    ( level, str )
    in
    internal 0
