defmodule Day2.Part1 do
  defp check_if_possible(rounds) do
    for {k, v} <- rounds do
      case {k, v} do
        {"blue", v} when v > 14 -> false
        {"green", v} when v > 13 -> false
        {"red", v} when v > 12 -> false
        _ -> true
      end
    end
  end

  defp sum_tail(t) do
    t
    |> String.trim_leading()
    |> String.replace(",", "")
    |> String.replace(";", "")
    |> String.split(" ")
    |> Enum.chunk_every(2)
    |> Enum.map(fn [v, k] -> {k, String.to_integer(v)} end)
    |> check_if_possible()
  end

  defp get_id(h) do
    h
    |> String.split(" ")
    |> Enum.at(1)
    |> String.to_integer()
  end

  defp iterate_over_input do
    for line <- Utils.read_file("lib/day2/input.txt") do
      [h, t] = String.split(line, ":")
      [get_id(h), sum_tail(t)]
    end
  end

  defp flattens(data) do
    for [id, v] <- data do
      [id, Enum.all?(v, fn x -> x end)]
    end
  end

  defp sum_id_if_true(data) do
    data
    |> Enum.filter(fn [_, v] -> v == true end)
    |> Enum.map(fn [id, _] -> id end)
    |> Enum.sum()
  end

  def run do
    iterate_over_input()
    |> flattens()
    |> sum_id_if_true()
  end
end
