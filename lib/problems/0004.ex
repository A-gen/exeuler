defmodule ExEuler.Problems.Problem0004 do
  @moduledoc """
  # Largest palindrome product
  A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
  Find the largest palindrome made from the product of two 3-digit numbers.

  ## Example 1
  iex> ExEuler.Problems.Problem0004.run(2)
  9009

  ## Answer
  iex> ExEuler.Problems.Problem0004.run(3)
  906609
  """

  def run(digits) do
    s = trunc :math.pow(10, digits - 1)
    e = trunc :math.pow(10, digits - 1) * 10 - 1
    for x <- s..e,
        y <- s..e,
        Integer.to_string(x * y) == String.reverse(Integer.to_string(x * y))
    do
      x * y
    end
    |> Enum.max
  end
end
