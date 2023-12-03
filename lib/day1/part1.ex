defmodule Day1.Part1 do
  def find_digit(line) do
    first_digit =
      line
      |> String.graphemes()
      |> Enum.find(fn x -> String.match?(x, ~r/\d/) end)

    last_digit =
      line
      |> String.reverse()
      |> String.graphemes()
      |> Enum.find(fn x -> String.match?(x, ~r/\d/) end)

    (first_digit <> last_digit)
    |> String.to_integer()
  end

  def find_digits do
    for line <- Utils.read_file("lib/day1/test_input2.txt") do
      line
      |> find_digit()
    end
  end

  def run do
    find_digits()
    |> Enum.sum()
  end
end
