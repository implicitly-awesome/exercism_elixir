defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    _compare(a, b)
  end

  defp _compare([], []), do: :equal
  defp _compare([], _list_b), do: :sublist
  defp _compare(_list_a, []), do: :superlist
  defp _compare(list_a, list_b) when length(list_a) == 1 and length(list_b) == 1, do: :unequal
  defp _compare(list, list), do: :equal

  defp _compare(list_a, list_b) when length(list_a) < length(list_b) do
    if is_sublist?(list_a, list_b), do: :sublist, else: :unequal
  end

  defp _compare(list_a, list_b) when length(list_a) > length(list_b) do
    if is_sublist?(list_b, list_a), do: :superlist, else: :unequal
  end

  # that trick doesnt work on huge lists
  #
  # defp is_sublist?(list_a, list_b) do
  #   Enum.join(list_b, "") =~ ~r{#{Enum.join(list_a, "")}}
  # end

  defp is_sublist?(list_a, list_b), do: is_sublist?(list_a, list_b, list_a)

  defp is_sublist?([], _, _), do: true

  # if tail of the second list is equal to first list
  defp is_sublist?(_, [_head | tail_b], tail_b), do: true

  # if current items are equal - go to next items pair
  defp is_sublist?([head | tail_a], [head | tail_b], list_a) do
    is_sublist?(tail_a, tail_b, list_a)
  end

  # if current items are not equal - shift the second list by one element
  # and proceed form start point (with actually given first array)
  defp is_sublist?([_head_a | _tail_a], [_head_b | tail_b], list_a) do
    is_sublist?(list_a, tail_b, list_a)
  end

  defp is_sublist?(_, _, _), do: false
end
