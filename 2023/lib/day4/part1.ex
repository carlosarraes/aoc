defmodule Day4.Part1 do
  defp clean_line(line) do
    line
    |> String.trim()
    |> String.replace(~r/  +/, " ")
  end

  defp count_common_elements(left, right) do
    left_list = String.split(left, " ")
    right_list = String.split(right, " ")

    Enum.count(left_list, fn x -> Enum.member?(right_list, x) end)
  end

  defp count_score(matches) do
    Enum.reduce(matches, 0, fn match_count, acc ->
      case match_count do
        0 -> acc
        _ -> acc + :math.pow(2, match_count - 1)
      end
    end)
  end

  def run do
    File.stream!("lib/day4/input.txt")
    |> Enum.map(&String.slice(&1, 10..-1))
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.split(&1, "|"))
    |> Enum.map(fn [left, right] ->
      [
        clean_line(left),
        clean_line(right)
      ]
    end)
    |> Enum.map(fn [left, right] ->
      count_common_elements(left, right)
    end)
    |> count_score()
  end
end
