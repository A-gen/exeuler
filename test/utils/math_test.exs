defmodule ExEuler.MathTest do
  use ExUnit.Case, async: true

  test "returns fibonacci numbers" do
    assert [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]  == ExEuler.Math.fibs         |> Enum.take(10)
    assert [1, 2, 3, 5, 8, 13, 21, 34, 55, 89] == ExEuler.Math.fibs({1, 2}) |> Enum.take(10)
  end

  test "return primes by Sieve of Eratosthenes" do
    assert [2, 3, 5, 7] == ExEuler.Math.Prime.sieve(10)
  end

  test "returns prime factors" do
    [
      { -1, nil},
      {  0, nil},
      {  1, [[1, 1]]},
      {  2, [[2, 1]]},
      {  4, [[2, 2]]},
      {  5, [[5, 1]]},
      {360, [[2, 3], [3, 2], [5, 1]]},
    ]
    |> Enum.each(fn {num, expect} ->
      assert expect == ExEuler.Math.Prime.prime_factors(num)
    end)
  end
end
