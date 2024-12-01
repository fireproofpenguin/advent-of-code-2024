defmodule Part02 do
  def read_input(file_name) do
    File.read(file_name)
  end

  def get_lines(input) do
    String.split(input, ["\n"], trim: true)
  end

  def make_int(string) do
    { num, _ } = Integer.parse(string)
    num
  end

  def create_lists([], acc) do
    acc
  end

  def create_lists(lines, []) do
    [head | tail] = lines
    [left, right] = String.split(head, " ", trim: true)
    create_lists(tail, { [make_int(left)], [make_int(right)]})
  end

  def create_lists(lines, { left_list, right_list }) do
    [head | tail] = lines
    [left, right] = String.split(head, " ", trim: true)
    create_lists(tail, { [make_int(left) | left_list ], [make_int(right) | right_list] })
  end

  def count_occurrences_for_num(num, list) do
    Enum.count(list, fn x -> x == num end)
  end

  def count_occurrences(left, right, total \\ 0)

  def count_occurrences([], _right, total) do
    total
  end

  def count_occurrences([head | tail], right, total) do
    new_total = total + (head * count_occurrences_for_num(head, right))
    count_occurrences(tail, right, new_total)
  end

  def compute_similarity_score(file_name) do
    {:ok, content} = read_input(file_name)
    lines = get_lines(content)
    { left, right } = create_lists(lines, [])
    count_occurrences(left, right)
  end
end
