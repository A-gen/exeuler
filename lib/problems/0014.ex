defmodule ExEuler.Problems.P0014 do
  @moduledoc """
  # Longest Collatz sequence
  The following iterative sequence is defined for the set of positive integers:
    n → n/2 (n is even)
    n → 3n + 1 (n is odd)
  Using the rule above and starting with 13, we generate the following sequence:
    13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
  It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
  Which starting number, under one million, produces the longest chain?

  NOTE: Once the chain starts the terms are allowed to go above one million.

  ## Answer
  iex> ExEuler.Problems.P0014.solve
  837799
  """

  def solve(n \\ 1_000_000) do
    Stream.iterate(n - (1 - rem(n, 2)), &(&1 - 2))
    |> Stream.take_while(&(&1 > (trunc n / 3)))
    |> Stream.map(&({&1, collatz(&1)}))
    |> Enum.sort_by(fn {_x, len} -> len end, &>=/2)
    |> List.first
    |> elem(0)
  end

  defp collatz(n), do: collatz(n, 1)
  defp collatz(1, count), do: count
  defp collatz(n, count) do
    next = if rem(n, 2) == 0, do: (trunc (n / 2)), else: n * 3 + 1
    collatz(next, count + 1)
  end
end
