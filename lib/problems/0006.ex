defmodule ExEuler.Problems.P0006 do
  @moduledoc """
  # Sum square difference
  The sum of the squares of the first ten natural numbers is,
    1^2 + 2^2 + ... + 10^2 = 385
  The square of the sum of the first ten natural numbers is,
    (1 + 2 + ... + 10)^2 = 55^2 = 3025
  Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
  Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

  ## Example 1
  iex> ExEuler.Problems.P0006.solve(10)
  2640

  ## Answer
  iex> ExEuler.Problems.P0006.solve
  25164150
  """

  def solve(num \\ 100) do
    sum = 1..num |> Enum.reduce(0, fn x, acc -> acc + x * x end)
    pow = trunc 1..num |> Enum.reduce(0, &+/2) |> :math.pow(2)
    pow - sum
  end
end
