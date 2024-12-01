defmodule Part02Test do
  use ExUnit.Case
  doctest Part02

  test "reads input file" do
    assert Part02.read_input("test_input.txt") == "3   4\n4   3\n2   5\n1   3\n3   9\n3   3\n"
  end

  test "gets lines of file" do
    assert Part02.get_lines("3   4\n4   5") == ["3   4", "4   5"]
  end

  test "gets individual lists" do
    assert Part02.create_lists(["3   4", "4   5"]) == {[4, 3], [5, 4]}
  end

  test "detects how many occurrences of value in list" do
    assert Part02.count_occurrences_for_num(4, [4, 5]) == 1
    assert Part02.count_occurrences_for_num(4, [3, 5, 6]) == 0
    assert Part02.count_occurrences_for_num(4, [3, 4, 5, 6, 4]) == 2
  end

  test "detects how many occurrences of list in list" do
    assert Part02.count_occurrences({[4, 3], [4, 5]}) == 4
    assert Part02.count_occurrences({[1,2,3], [1, 1, 2, 4, 5]}) == 4
  end

  test "computes test file" do
    assert Part02.compute_similarity_score("test_input.txt") == 31
  end
end
