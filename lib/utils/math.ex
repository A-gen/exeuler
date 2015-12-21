defmodule ExEuler.Math do
  def fibs(first \\ {1, 1}), do: Stream.unfold(first, fn {a, b} -> {a, {b, a + b}} end)
end
