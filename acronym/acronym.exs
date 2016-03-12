defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> split_to_words
    |> acronymize_words
    |> join_words
  end

  defp split_to_words(sentence) do
    sentence |> String.split
  end

  defp acronymize_words(words) do
    Enum.map(words, fn word ->
      Regex.scan(~r{[A-Z]}, normalize_word(word)) |> List.flatten
    end)
  end

  defp normalize_word(word) do
    first_letter_capitalized = word
                               |> String.first
                               |> String.capitalize
    String.replace_prefix(word, String.first(word), first_letter_capitalized)
  end

  defp join_words(words) do
    Enum.join(words, "")
  end
end
