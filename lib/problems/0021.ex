defmodule ExEuler.Problems.P0021 do
  @moduledoc """
  # Amicable numbers
  Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
  If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

  For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

  Evaluate the sum of all the amicable numbers under 10000.

  ## Answer
  iex> ExEuler.Problems.P0021.solve
  31626
  """

  def solve(max \\ 10_000) do
    2..(max - 1)
    |> Enum.filter(&amicable_number?/1)
    |> Enum.reduce(&+/2)
  end

  defp amicable_number?(n) do
    da = d(n)
    db = d(da)
    n == db && da != n
  end
  defp d(1), do: 0
  defp d(n), do: ExEuler.Math.proper_divisors(n) |> Enum.reduce(fn (x, acc) -> x + acc end)
end
