defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  @spec generate(integer, list) :: {:ok, map} | :error
  def generate(amount, values) do
    do_search(amount, Enum.sort(values, &(&1 > &2)), %{})
  end

  defp do_search(0, [], acc), do: {:ok, acc}
  defp do_search(amount, [max | tail], acc) do
    reminder = rem(amount, max)
    cond do
      reminder < amount || reminder == 0 ->
        do_search((amount - max * (div(amount, max))), tail, Map.put(acc, max, div(amount, max)))
      true ->
        do_search(amount, tail, Map.put(acc, max, 0))
    end
  end
  defp do_search(_, [], _), do: :error
end
