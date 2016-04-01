defmodule Gigasecond do

  @gigasecond :math.pow(10, 9) |> round

  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) :: :calendar.datetime
  # {{year, month, day}, {hours, minutes, seconds}} = Erlang :calendar.datetime
  def from(datetime) do
    in_seconds = :calendar.datetime_to_gregorian_seconds(datetime)
    :calendar.gregorian_seconds_to_datetime(in_seconds + @gigasecond)
  end
end
