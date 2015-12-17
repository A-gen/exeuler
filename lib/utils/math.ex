defmodule ExEuler.Math do
  def fibs(first \\ {1, 1}), do: Stream.unfold(first, fn {a, b} -> {a, {b, a + b}} end)

  def primes do
    [2]
    |> Stream.concat(
      Stream.iterate(3, &(&1 + 2))
      |> Stream.unfold(fn seq ->
        p = Enum.at(seq, 0)
        next = Stream.reject(seq, &(rem(&1, p) == 0))
        {p, next}
      end)
    )
  end

  def prime_factors(number) when number < 1, do: nil
  def prime_factors(number) when number < 4, do: [[number, 1]]
  def prime_factors(number) do
    elements = Enum.to_list(2..(trunc :math.sqrt(number)))
    _prime_factors(number, elements, [])
    |> Stream.unfold(fn
      [] -> nil
      seq ->
        first = Enum.at(seq, 0)
        count = Enum.count(seq, &(first == &1))
        next = Enum.reject(seq, &(first == &1))
        {[first, count], next}
    end)
    |> Enum.to_list
  end

  defp _prime_factors(number, [], factors) when number == 0, do: factors
  defp _prime_factors(number, [], factors) when number != 1, do: factors ++ [number]
  defp _prime_factors(number, [], factors), do: factors
  defp _prime_factors(number, primes = [p | _], factors) when rem(number, p) == 0, do: _prime_factors((trunc number / p), primes, factors ++ [p])
  defp _prime_factors(number, [p | t], factors), do: _prime_factors(number, t, factors)
end
