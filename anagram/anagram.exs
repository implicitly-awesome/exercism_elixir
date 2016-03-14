defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    _match(base, candidates, [])
  end

  defp _match(_base, [], acc), do: Enum.reverse(acc)
  defp _match(base, [candidate | tail], acc) do
    base_downcased = String.downcase(base)
    base_letters = normalize_word(base_downcased)

    candidate_downcased = String.downcase(candidate)
    candidate_letters = normalize_word(candidate_downcased)

    cond do
      base_downcased == candidate_downcased ->
        _match(base, tail, acc)
      base_letters == candidate_letters ->
        _match(base, tail, [candidate | acc])
      true ->
        _match(base, tail, acc)
    end
  end

  defp normalize_word(word) do
    word
    |> String.split("", trim: true)
    |> Enum.sort
  end
end
