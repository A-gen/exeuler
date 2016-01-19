defmodule ExEuler.Problems.P0015 do
  @moduledoc """
  # Lattice paths
  Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
  How many such routes are there through a 20×20 grid?

  ## Example 1
  iex> ExEuler.Problems.P0015.solve({2, 2})
  6

  ## Answer
  iex> ExEuler.Problems.P0015.solve
  137846528820
  """

  def solve({x, y} \\ {20, 20}) do
    (ExEuler.Math.fact(x + y) / (ExEuler.Math.fact(x) * ExEuler.Math.fact(y))) |> trunc
  end
end
