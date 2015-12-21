defmodule ExEuler.Math.Prime do
  def sieve(n) when n < 2, do: []
  def sieve(n), do: 2..n |> ExEuler.List.to_list |> _sieve(n, [])
  defp _sieve([], _n, prs), do: prs
  defp _sieve([h | t], n, prs) do
    cond do
      :math.sqrt(n) < h -> _sieve([], n, prs ++ [h] ++ t)
      true              -> t |> Enum.reject(&(rem(&1, h) == 0)) |> _sieve(n, prs ++ [h])
    end
  end

  def stream do
    [2]
    |> Stream.concat(
      Stream.iterate(3, &(&1 + 2))
      |> Stream.unfold(fn seq ->
        p = seq |> Enum.at(0)
        next = seq |> Stream.reject(&(rem(&1, p) == 0))
        {p, next}
      end)
    )
  end

  def is_prime(n), do: is_prime(n, sieve(n))
  def is_prime(n, seq), do: Enum.any?(seq, &(&1 == n))

  def prime_factors(number) when number < 1, do: nil
  def prime_factors(number) when number < 4, do: [[number, 1]]
  def prime_factors(number) do
    #elements = sieve(trunc :math.sqrt(number))
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
