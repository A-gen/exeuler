defmodule ExEuler.Problems.P0018 do
  @moduledoc """
  # Maximum path sum I
  By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
      3
     7 4
    2 4 6
   8 5 9 3
  That is, 3 + 7 + 4 + 9 = 23.

  Find the maximum total from top to bottom of the triangle below:
                 75
                95 64
               17 47 82
              18 35 87 10
             20 04 82 47 65
            19 01 23 75 03 34
           88 02 77 73 07 63 67
          99 65 04 28 06 16 70 92
         41 41 26 56 83 40 80 70 33
        41 48 72 33 47 32 37 16 94 29
       53 71 44 65 25 43 91 52 97 51 14
      70 11 33 28 77 73 17 78 39 68 17 57
     91 71 52 38 17 14 91 43 58 50 27 29 48
    63 66 04 68 89 53 67 30 73 16 69 87 40 31
   04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
  NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)

  ## Answer
  iex> ExEuler.Problems.P0018.solve
  1074
  """

  @pyramid [
    ["75"],
    ["95", "64"],
    ["17", "47", "82"],
    ["18", "35", "87", "10"],
    ["20", "04", "82", "47", "65"],
    ["19", "01", "23", "75", "03", "34"],
    ["88", "02", "77", "73", "07", "63", "67"],
    ["99", "65", "04", "28", "06", "16", "70", "92"],
    ["41", "41", "26", "56", "83", "40", "80", "70", "33"],
    ["41", "48", "72", "33", "47", "32", "37", "16", "94", "29"],
    ["53", "71", "44", "65", "25", "43", "91", "52", "97", "51", "14"],
    ["70", "11", "33", "28", "77", "73", "17", "78", "39", "68", "17", "57"],
    ["91", "71", "52", "38", "17", "14", "91", "43", "58", "50", "27", "29", "48"],
    ["63", "66", "04", "68", "89", "53", "67", "30", "73", "16", "69", "87", "40", "31"],
    ["04", "62", "98", "27", "23", "09", "70", "98", "73", "93", "38", "53", "60", "04", "23"],
  ]

  def solve(_ \\ :dummy) do
    @pyramid
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
