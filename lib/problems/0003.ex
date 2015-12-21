defmodule ExEuler.Problems.Problem0003 do
  @moduledoc """
  # Largest prime factor
  The prime factors of 13195 are 5, 7, 13 and 29.
  What is the largest prime factor of the number 600851475143 ?

  ## Example 1
  iex> ExEuler.Problems.Problem0003.run(13195)
  29

  ## Answer
  iex> ExEuler.Problems.Problem0003.run(600851475143)
  6857
  """

  def run(number) do
    ExEuler.Math.Prime.prime_factors(number) |> Enum.map(&(Enum.at(&1, 0))) |> Enum.max
  end
end
