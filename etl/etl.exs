defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Map) :: map()
  def transform(input) do
    Map.to_list(input)
    |> invert_keyword
    |> Enum.into(%{})
  end

  defp invert_keyword(list) do
    Enum.map(list, fn({points, values}) ->
      Enum.map(values, &({String.downcase(&1), points}))
    end)
    |> List.flatten
  end
end
