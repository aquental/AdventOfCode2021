defmodule One do
  @default_file_name "data/day-one.data"

  def load_data(n \\ @default_file_name) do
    case File.read(n) do
      {:ok, content} ->
        content
        |> String.split("\n", trim: true)
        |> Enum.map(&String.to_integer/1)

      {:error, err} ->
        IO.inspect(err)
    end
  end

  defp greater?([a, b]) do
    if a < b do
      1
    else
      0
    end
  end

  defp greater?([a, b, c, d]) do
    if a + b + c < b + c + d do
      1
    else
      0
    end
  end

  def part1(lst) do
    lst
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(fn [a, b] -> greater?([a, b]) end)
    |> Enum.sum()
  end

  def part2(lst) do
    lst
    |> Enum.chunk_every(4, 1, :discard)
    |> Enum.map(fn [a, b, c, d] -> greater?([a, b, c, d]) end)
    |> Enum.sum()
  end

  def run do
    data = load_data()
    p1 = part1(data)
    IO.puts("part 1: #{p1}")
    p2 = part2(data)
    IO.puts("part 2: #{p2}")
  end
end
