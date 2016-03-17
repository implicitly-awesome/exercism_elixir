defmodule DNA do

  @nucleotides_transcribe %{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U}

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &Map.get(@nucleotides_transcribe, &1, ''))

    # Enum.map(dna, &transcribe(&1))
  end

  # defp transcribe(?G), do: ?C
  # defp transcribe(?C), do: ?G
  # defp transcribe(?T), do: ?A
  # defp transcribe(?A), do: ?U
  #
  # defp transcribe(nucleotide) do
  #   case nucleotide do
  #     ?G -> ?C
  #     ?C -> ?G
  #     ?T -> ?A
  #     ?A -> ?U
  #     _ -> nil
  #   end
  # end
end
