defmodule ExEuler.Problems.Problem0007 do
  @moduledoc """
  # 10001st prime
  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
  What is the 10 001st prime number?

  ## Example 1
  iex> ExEuler.Problems.Problem0007.run(6)
  13

  ## Answer
  iex> ExEuler.Problems.Problem0007.run(10001)
  104743
  """

  def run(n) do
    max = n * (:math.log(n) + :math.log(:math.log(n)))
    ExEuler.Math.Prime.sieve(max) |> Enum.at(n - 1)
  end
end
