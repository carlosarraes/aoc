defmodule Day1.Part2 do
  defp find_matching_number_word(new_acc, number_map) do
    number_map
    |> Map.keys()
    |> Enum.find(fn key ->
      String.contains?(new_acc, key)
    end)
  end

  defp find_digit(line, number_map) do
    line
    |> String.graphemes()
    |> Enum.reduce_while("", fn grapheme, acc ->
      if String.match?(grapheme, ~r/\d/) do
        {:halt, grapheme}
      else
        new_acc = acc <> grapheme
        match = find_matching_number_word(new_acc, number_map)

        if match do
          case Map.fetch(number_map, match) do
            {:ok, value} -> {:halt, value}
            :error -> {:cont, new_acc}
          end
        else
          {:cont, new_acc}
        end
      end
    end)
  end

  def find_digits(line) do
    number_map = %{
      "one" => "1",
      "two" => "2",
      "three" => "3",
      "four" => "4",
      "five" => "5",
      "six" => "6",
      "seven" => "7",
      "eight" => "8",
      "nine" => "9"
    }

    reversed_number_map = Map.new(number_map, fn {key, value} -> {String.reverse(key), value} end)

    (find_digit(line, number_map) <> find_digit(String.reverse(line), reversed_number_map))
    |> String.to_integer()
  end

  def iterate_over_file do
    for line <- Utils.read_file("lib/day1/input.txt") do
      line
      |> find_digits()
    end
  end

  def run do
    iterate_over_file()
    |> Enum.sum()
  end
end
