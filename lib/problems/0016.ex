defmodule ExEuler.Problems.P0016 do
  @moduledoc """
  # Power digit sum
  2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
  What is the sum of the digits of the number 2^1000?

  ## Example 1
  iex> ExEuler.Problems.P0016.solve(15)
  26

  ## Answer
  iex> ExEuler.Problems.P0016.solve
  1366
  """

  def solve(n \\ 1000) do
    :math.pow(2, n)
    |> trunc
    |> Integer.to_string
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce(0, &+/2)
  end
end
