defmodule ExEuler.Problems.Problem0010 do
  @moduledoc """
  # Special Pythagorean triplet
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
    a^2 + b^2 = c^2
  For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.

  ## Example 1
  iex > ExEuler.Problems.Problem0010.run(10)
  17

  ## Answer
  iex> ExEuler.Problems.Problem0010.run(2_000_000)
  142913828922
  """

  def run(n) do
    ExEuler.Math.Prime.sieve(n) |> Enum.reduce(0, &+/2)
  end
end
