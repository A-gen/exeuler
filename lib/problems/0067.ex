defmodule ExEuler.Problems.P0067 do
  @moduledoc """
  # Maximum path sum I
  By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
      3
     7 4
    2 4 6
   8 5 9 3
  That is, 3 + 7 + 4 + 9 = 23.

  Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'), a 15K text file containing a triangle with one-hundred rows.
  NOTE: This is a much more difficult version of Problem 18. It is not possible to try every route to solve this problem, as there are 2^99 altogether! If you could check one trillion (10^12) routes every second it would take over twenty billion years to check them all. There is an efficient algorithm to solve it. ;o)

  ## Answer
  iex> ExEuler.Problems.P0067.solve
  7273
  """

  def solve(filename \\ "./test/resources/p067_triangle.txt") do
    File.read!(filename)
    |> String.split("\n", trim: true)
    |> Enum.map(fn line -> String.split(line, " ", trim: true) end)
    |> Enum.map(fn line -> line |> Enum.map(&String.to_integer/1) end)
    |> Enum.reverse
    |> _solve
  end

  defp _solve([[answer]]), do: answer
  defp _solve([previous | [target | tail]]) do
    biggers = previous |> to_pairs |> pick_biggers
    [Enum.zip(biggers, target) |> Enum.map(&sum/1)]
    |> Enum.concat(tail)
    |> _solve
  end

  defp to_pairs(arr), do: to_pairs(arr, [])
  defp to_pairs([], acc), do: acc
  defp to_pairs([_], acc), do: acc
  defp to_pairs([a1 | [a2 | _] = t], acc) do
    to_pairs(t, acc ++ [{a1, a2}])
  end

  defp pick_biggers(arr), do: Enum.map(arr, &pick_bigger/1)
  defp pick_bigger({a1, a2}) when a1 < a2, do: a2
  defp pick_bigger({a1, _}), do: a1

  defp sum({a1, a2}), do: a1 + a2
end
