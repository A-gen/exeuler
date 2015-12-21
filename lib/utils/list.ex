defmodule ExEuler.List do
  def infinite(min \\ 0), do: Stream.iterate(min, &(&1 + 1))
  def to_list(s..e), do: infinite(s) |> Stream.take_while(&(&1 <= e)) |> Enum.to_list
end
