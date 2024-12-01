defmodule Part01Test do
  use ExUnit.Case
  doctest Part01

  test "reads input file" do
    assert Part01.read_input("test_input.txt") == {:ok, "3   4\n4   3\n2   5\n1   3\n3   9\n3   3\n"}
  end

  test "gets lines of file" do
    assert Part01.get_lines("3   4\n4   5") == ["3   4", "4   5"]
  end

  test "gets individual lists" do
    assert Part01.create_lists(["3   4", "4   5"], []) == {[4, 3], [5, 4]}
  end

  test "calculates distance between lists" do
    assert Part01.calc_distance([3, 4], [4, 5]) == 2
    assert Part01.calc_distance([1, 7], [4, 5]) == 5
  end

  test "computes test file" do
    assert Part01.compute("test_input.txt") == 11
  end
end
