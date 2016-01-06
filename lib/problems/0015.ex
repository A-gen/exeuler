defmodule ExEuler.Problems.Problem0015 do
  @moduledoc """
  # Lattice paths
  Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
  How many such routes are there through a 20×20 grid?

  ## Example 1
  iex> ExEuler.Problems.Problem0015.run({2, 2})
  6

  ## Answer
  iex> ExEuler.Problems.Problem0015.run({20, 20})
  137846528820
  """

  def run({x, y}) do
    (ExEuler.Math.fact(x + y) / (ExEuler.Math.fact(x) * ExEuler.Math.fact(y))) |> trunc
  end
end
