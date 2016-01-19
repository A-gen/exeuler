defmodule ExEuler.Problems.P0005 do
  @moduledoc """
  # Smallest multiple
  2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
  What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

  ## Example 1
  iex> ExEuler.Problems.P0005.solve(1..10)
  2520

  ## Answer
  iex> ExEuler.Problems.P0005.solve
  232792560
  """

  def solve(range \\ 1..20) do
    range
    |> Enum.map(&ExEuler.Math.Prime.prime_factors/1) # prime factors
    |> Enum.reduce([], fn factors, acc -> acc ++ factors end) # flatten
    |> Enum.group_by(fn [a, _] -> a end)
    |> Enum.reduce(1, fn ({_key, factors}, acc) ->
      acc * (factors |> Enum.map(fn [a, b] -> trunc :math.pow(a, b) end) |> Enum.max)
    end)
  end
end
