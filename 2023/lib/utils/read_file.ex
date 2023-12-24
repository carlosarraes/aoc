defmodule Utils do
  def read_file(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
  end
end
