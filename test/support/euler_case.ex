defmodule ExEuler.EulerCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use ExUnit.Case

      __ENV__.file
      |> Path.dirname
      |> Path.join("../lib/problems/*")
      |> Path.wildcard
      |> Enum.map(&(Path.basename(&1, ".ex")))
      |> Enum.map(fn fname -> Module.concat(ExEuler.Problems, "P#{fname}") end)
      |> Enum.each(fn module -> doctest module end)
    end
  end
end
