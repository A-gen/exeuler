defmodule ExEuler.Problems.P0001 do
  @moduledoc """
  # Multiples of 3 and 5
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
  Find the sum of all the multiples of 3 or 5 below 1000.

  ## Example
  iex> ExEuler.Problems.P0001.solve(10)
  23

  ## Answer
  iex> ExEuler.Problems.P0001.solve
  233168
  """
  def solve(max \\ 1000) do
    1..(max - 1)
    |> Enum.filter(fn x -> rem(x, 3) == 0 || rem(x, 5) == 0 end)
    |> Enum.reduce(&+/2)
  end
end
