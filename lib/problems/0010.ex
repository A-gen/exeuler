defmodule ExEuler.Problems.P0010 do
  @moduledoc """
  # Summation of primes
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
  Find the sum of all the primes below two million.

  ## Example 1
  iex > ExEuler.Problems.P0010.solve(10)
  17

  ## Answer
  iex> ExEuler.Problems.P0010.solve
  142913828922
  """

  def solve(n \\ 2_000_000) do
    ExEuler.Math.Prime.sieve(n) |> Enum.reduce(0, &+/2)
  end
end
