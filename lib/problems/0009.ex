defmodule ExEuler.Problems.Problem0009 do
  @moduledoc """
  # Special Pythagorean triplet
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
    a^2 + b^2 = c^2
  For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.

  ## Answer
  iex> ExEuler.Problems.Problem0009.run(1000)
  31875000
  """

  def run(n) do
    for a <- 1..(n - 2),
        b <- a..(n - 1 - a),
        c = n - a - b,
        a * a + b * b == c * c,
        a + b + c == 1000 do
          a * b * c
        end
    |> Enum.at(0)
  end
end
