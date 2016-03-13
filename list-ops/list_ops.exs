defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(list) do
    _count(list, 0)
  end

  defp _count([], total), do: total
  defp _count([_head | tail], total) do
    _count(tail, total + 1)
  end

  @spec reverse(list) :: list
  def reverse(list) do
    _reverse(list, [])
  end

  def _reverse([], acc), do: acc
  def _reverse([head | tail], acc) do
    _reverse(tail, [head | acc])
  end

  @spec map(list, (any -> any)) :: list
  def map(list, func) do
    _map(list, func)
  end

  defp _map([], _func), do: []
  defp _map([head | tail], func) do
    [func.(head) | _map(tail, func)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(list, func) do
    _filter(list, func)
  end

  defp _filter([], _func), do: []
  defp _filter([head | tail], func) do
    if func.(head), do: [head | _filter(tail, func)], else: _filter(tail, func)
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(list, acc, func) do
    _reduce(list, acc, func)
  end

  defp _reduce([], acc, _func), do: acc
  defp _reduce([head | tail], acc, func) do
    _reduce(tail, func.(head, acc), func)
  end

  @spec append(list, list) :: list
  def append(list_a, list_b) do
    _append(list_a, list_b)
  end

  defp _append([], []), do: []
  defp _append([], list_b), do: list_b
  defp _append(list_a, []), do: list_a
  defp _append(list_a, list_b), do: list_a ++ list_b

  @spec concat([[any]]) :: [any]
  def concat(list_of_lists) do
    _concat(list_of_lists, [])
  end

  defp _concat([], acc), do: acc
  defp _concat([head | tail], acc) do
    _concat(tail, append(acc, head))
  end
end
