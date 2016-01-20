defmodule ExEuler.Math do
  def fibs(first \\ {1, 1}), do: Stream.unfold(first, fn {a, b} -> {a, {b, a + b}} end)

  def triangular_numbers do
    Stream.unfold(1, fn n ->
      next = trunc ((n * (n + 1)) / 2)
      {next, n + 1}
    end)
  end

  def divisors(1), do: [1]
  def divisors(number), do: proper_divisors(number) |> Enum.concat([number])

  def proper_divisors(1), do: []
  def proper_divisors(number), do: 1..(trunc number / 2) |> Enum.filter(&(rem(number, &1) == 0))

  def divisors_count(1), do: 1
  def divisors_count(number), do: ExEuler.Math.Prime.prime_factors(number) |> Enum.reduce(1, fn [_, count], acc -> acc * (count + 1) end)

  def fact(0), do: 1
  def fact(1), do: 1
  def fact(n), do: 2..n |> Enum.reduce(&*/2)
end
