defmodule ExEuler.Math do
  def fibs(first \\ {1, 1}), do: Stream.unfold(first, fn {a, b} -> {a, {b, a + b}} end)

  def primes do
    [2]
    |> Stream.concat(
      Stream.iterate(3, &(&1 + 2))
      |> Stream.unfold(fn s ->
        p = Enum.at(s, 0)
        next = Stream.reject(s, &(rem(&1, p) == 0))
        {p, next}
      end)
    )
  end
  def primes(max), do: primes |> Stream.take_while(&(&1 <= max))

  def prime_factors(number), do: _prime_factors(number, Enum.to_list(2..(trunc :math.sqrt(number))), [])

  def _prime_factors(number, [], factors), do: factors
  def _prime_factors(number, primes = [p | _], factors) when rem(number, p) == 0, do: _prime_factors((trunc number / p), primes, factors ++ [p])
  def _prime_factors(number, [p | t], factors), do: _prime_factors(number, t, factors)
end
