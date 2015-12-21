defmodule ExEuler.Problems.Problem0005 do
  @moduledoc """
  # Smallest multiple
  2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
  What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

  ## Example 1
  iex> ExEuler.Problems.Problem0005.run(1..10)
  2520

  ## Answer
  iex> ExEuler.Problems.Problem0005.run(1..20)
  232792560
  """

  def run(range) do
    #target = s..e |> Enum.reject(&(&1 == 1))
    #Stream.iterate(e, &(&1 + e))
    #|> Stream.filter(fn x -> Enum.all?(target, fn y -> rem(x, y) == 0 end) end)
    #|> Enum.take(1)
    #|> Enum.at(0)

    range
    |> Enum.map(&ExEuler.Math.Prime.prime_factors/1) # prime factors
    |> Enum.reduce([], fn factors, acc -> acc ++ factors end) # flatten
    |> Enum.group_by(fn [a, _] -> a end)
    |> Enum.reduce(1, fn ({key_, factors}, acc) ->
      acc * (factors |> Enum.map(fn [a, b] -> trunc :math.pow(a, b) end) |> Enum.max)
    end)
  end
end
