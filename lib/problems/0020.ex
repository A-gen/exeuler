defmodule ExEuler.Problems.P0020 do
  @moduledoc """
  # Factorial digit sum
  n! means n × (n − 1) × ... × 3 × 2 × 1

  For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
  and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

  Find the sum of the digits in the number 100!

  ## Answer
  iex> ExEuler.Problems.P0020.solve
  648
  """

  def solve(n \\ 100) do
    ExEuler.Math.fact(n)
    |> Integer.to_string
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce(fn x, acc -> x + acc end)
  end
end
