defmodule ExEuler.Problems.Problem0002 do
  @moduledoc """
  # Even Fibonacci numbers
  Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
    1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
  By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

  ## Example 1
  iex> ExEuler.Problems.Problem0002.run(10)
  10

  ## Example 2
  iex> ExEuler.Problems.Problem0002.run(50)
  44

  ## Answer
  iex> ExEuler.Problems.Problem0002.run(4_000_000)
  4613732
  """

  require Integer

  def run(max \\ 10) do
    ExEuler.Math.fibs({1, 2})
    |> Stream.take_while(fn x -> x <= max end)
    |> Stream.filter(&Integer.is_even/1)
    |> Enum.reduce(&+/2)
  end
end