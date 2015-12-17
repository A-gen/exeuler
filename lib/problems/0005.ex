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

  def run(s..e = range) do
    target = s..e |> Enum.reject(&(&1 == 1))
    Stream.iterate(e, &(&1 + e))
    |> Stream.filter(fn x ->
      Enum.all?(target, fn y -> rem(x, y) == 0 end)
    end)
    |> Enum.take(1)
    |> Enum.at(0)
  end
end
