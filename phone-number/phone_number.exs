defmodule Phone do

  @invalid_number "0000000000"

  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    raw |> get_digits |> normalize_digits |> get_string
  end

  defp get_digits(raw) do
    if String.match?(raw, ~r{[a-zA-Z]}) do
      []
    else
      Regex.scan(~r{[0-9]}, raw) |> List.flatten
    end
  end

  defp normalize_digits(digits) when length(digits) < 10, do: []
  defp normalize_digits(digits) when length(digits) > 11, do: []
  defp normalize_digits(digits = [head | tail]) when length(digits) == 11 do
    case head do
      "1" -> tail
      _ -> []
    end
  end
  defp normalize_digits(digits), do: digits

  defp get_string([]), do: @invalid_number
  defp get_string(digits) do
    digits |> Enum.join("")
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw |> get_digits |> normalize_digits |> Enum.take(3) |> to_string
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    number = raw |> number |> get_digits |> Enum.drop(3)
    code = raw |> area_code
    "(#{code}) #{Enum.take(number, 3)}-#{Enum.drop(number, 3)}"
  end
end
