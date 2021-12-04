defmodule OneTest do
  use ExUnit.Case
  doctest One

  test "one part 1" do
    data = load_data()
    assert part1(data) == 1696
  end

  test "one part 2" do
    data = load_data()
    assert part2(data) == 1737
  end
end