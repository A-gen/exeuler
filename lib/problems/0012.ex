defmodule ExEuler.Problems.Problem0012 do
  @moduledoc """
  # Highly divisible triangular number
  The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
    1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
  Let us list the factors of the first seven triangle numbers:

     1: 1
     3: 1,3
     6: 1,2,3,6
    10: 1,2,5,10
    15: 1,3,5,15
    21: 1,3,7,21
    28: 1,2,4,7,14,28

  We can see that 28 is the first triangle number to have over five divisors.
  What is the value of the first triangle number to have over five hundred divisors?

  ## Example 1
  iex> ExEuler.Problems.Problem0012.run(5)
  28

  ## Answer
  iex> ExEuler.Problems.Problem0012.run(500)
  76576500
  """

  def run(count) do
    ExEuler.Math.triangular_numbers |> Stream.filter(fn x -> ExEuler.Math.divisors_count(x) > count end) |> Enum.take(1) |> hd
  end
end