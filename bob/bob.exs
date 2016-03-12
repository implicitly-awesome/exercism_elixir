defmodule Bob do
  def hey(input) do
    cond do
        input =~ ~r([A-ZА-Я]{2,})
          -> "Whoa, chill out!"
        String.ends_with?(input, "?")
          -> "Sure."
        input |> String.strip |> String.length == 0
          -> "Fine. Be that way!"
        true
          -> "Whatever."
    end
  end
end
