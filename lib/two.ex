defmodule Two do
    @default_file_name "data/day-two.data"
  
    def load_data(n \\ @default_file_name) do
      case File.read(n) do
        {:ok, content} ->
          content
          |> String.split("\n", trim: true)
          |> Enum.map(fn val ->
            String.split(val, " ")
            |> Enum.reduce(fn a, b -> [String.to_atom(b), String.to_integer(a)] end)
          end)
  
        {:error, err} ->
          IO.inspect(err)
      end
    end
  
    def part1(data) do
      {hor, vert} =
        data
        |> Enum.reduce({0, 0}, fn cmd, acc ->
          # IO.inspect("cmd #{inspect(cmd)}, acc #{inspect(acc)}")
          [dir, step] = cmd
          # IO.inspect("dir #{inspect dir}, step #{inspect step}")
          {hor, vert} = acc
          # IO.inspect("hor #{inspect hor}, vert #{inspect vert}")
          case dir do
            :forward ->
              {hor + step, vert}
            :up ->
              {hor, vert + step}
            :down ->
              {hor, vert - step}
          end
        end)
  
      # IO.inspect("{hor,vert}={#{inspect(hor)},#{inspect(vert)}}")
      abs(hor * vert)
    end
  
    def part2(data) do
      {hor, vert, _} =
      data
      |> Enum.reduce({0, 0, 0}, fn cmd, acc ->
          # IO.inspect("cmd #{inspect(cmd)}, acc #{inspect(acc)}")
          [dir, step] = cmd
          # IO.inspect("dir #{inspect dir}, step #{inspect step}")
          {hor, vert, aim} = acc
          # IO.inspect("hor #{inspect hor}, vert #{inspect vert}, aim #{inspect aim}")
  
          case dir do
            :forward ->
              if aim == 0 do
                {hor + step, vert, aim}
              else
                {hor + step, vert + aim * step, aim}
              end
            :up ->
              {hor, vert, aim - step}
            :down ->
              {hor, vert, aim + step}
          end
        end)
  
      # IO.inspect({hor,vert})
      abs(hor * vert)
    end
  
    def run do
      data = load_data()
      p1 = part1(data)
      IO.puts("part 1: #{p1}")
      p2 = part2(data)
      IO.puts("part 2: #{p2}")
    end
  end