defmodule BracketPush do

  @pairs %{"{" => "}", "[" => "]", "(" => ")"}

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> String.codepoints
    |> Enum.filter(fn(x) -> x in Map.keys(@pairs) ++ Map.values(@pairs) end)
    |> do_check([])
  end

  defp do_check([], []), do: true
  defp do_check([], _), do: false
  defp do_check([current | t], acc) do
    cond do
      Map.has_key?(@pairs, current) ->
        do_check(t, [Map.get(@pairs, current) | acc])
      not Map.has_key?(@pairs, current) ->
        if length(acc) > 0 and hd(acc) == current do
          do_check(t, List.delete(acc, current))
        else
          false
        end
      true ->
        true
    end
  end
end
