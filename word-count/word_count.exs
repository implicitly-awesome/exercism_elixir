defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> downcase
    |> split
    |> count_words
  end

  defp downcase(sentence) do
    String.downcase(sentence)
  end

  defp split(sentence) do
    Regex.scan(~r/(*UTF)[\p{L}0-9-]+/i, sentence) |> List.flatten
  end

  defp count_words(words) do
    Enum.reduce(words, %{}, fn(word, map) ->
      Map.update(map, word, 1, &(&1 + 1))
    end)
  end
end
