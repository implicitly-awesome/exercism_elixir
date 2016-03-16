defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    validate!(strand, nucleotide)
    Enum.count(strand, &(&1 == nucleotide))
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: Map
  def histogram(strand) do
    validate!(strand)
    for char <- strand, into: Map.new(@nucleotides, &({&1, 0})) do
      {char, Enum.count(strand, &(&1 == char))}
    end
  end

  defp validate!(strand) do
    unless Enum.all?(strand, &(&1 in @nucleotides)), do: raise ArgumentError
  end

  defp validate!(strand, nucleotide) do
    unless nucleotide in @nucleotides, do: raise ArgumentError
    validate!(strand)
  end
end
