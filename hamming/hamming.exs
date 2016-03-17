defmodule DNA do

  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) when length(strand1) == length(strand2) do
    count_difference(strand1, strand2, 0)
  end
  def hamming_distance(_, _), do: nil

  defp count_difference([], _, acc), do: acc

  defp count_difference([nucl1 | tail1], [nucl1 | tail2], acc) do
    count_difference(tail1, tail2, acc)
  end
  defp count_difference([_nucl1 | tail1], [_nucl2 | tail2], acc) do
    count_difference(tail1, tail2, acc + 1)
  end
end
