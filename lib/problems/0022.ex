defmodule ExEuler.Problems.P0022 do
  @moduledoc """
  # Amicable numbers
  Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
  If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

  For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

  Evaluate the sum of all the amicable numbers under 10000.

  ## Answer
  iex> ExEuler.Problems.P0022.solve
  871198282
  """

  def solve(filename \\ "./test/resources/p022_names.txt") do
    File.read!(filename)
    |> String.replace(~r/["\n]/, "")
    |> String.split(",", trim: true)
    |> Enum.sort
    |> Enum.with_index(1)
    |> Enum.map(&scoreing/1)
    |> Enum.reduce(&+/2)
  end

  defp scoreing({name, index}), do: scoreing(name, 0) * index #{{name, scoreing(name, 0)}, index}
  defp scoreing("", acc), do: acc
  defp scoreing(<<head, tail :: binary>>, acc), do: scoreing(tail, acc + (head - (?A - 1)))
end
