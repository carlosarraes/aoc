defmodule Day2.Part2 do
  defp sum_tail(t) do
    t
    |> String.trim_leading()
    |> String.replace(",", "")
    |> String.replace(";", "")
    |> String.split(" ")
    |> Enum.chunk_every(2)
    |> Enum.map(fn [v, k] -> {k, String.to_integer(v)} end)
    |> Enum.reduce(%{}, fn {k, v}, acc ->
      Map.update(acc, k, v, fn existing_value ->
        max(existing_value, v)
      end)
    end)
    |> Enum.reduce(1, fn {_, v}, acc ->
      acc * v
    end)
  end

  defp iterate_over_input do
    for line <- Utils.read_file("lib/day2/input.txt") do
      [_, t] = String.split(line, ":")
      sum_tail(t)
    end
  end

  def run do
    iterate_over_input()
    |> Enum.sum()
  end
end
