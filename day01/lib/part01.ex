defmodule Part01 do
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

  def calc_distance(left, right, total \\ 0)

  def calc_distance([], [], total) do
    total
  end

  def calc_distance([], _right, total) do
    total
  end

  def calc_distance(_left, [], total) do
    total
  end

  def calc_distance(left, right, total) do
    [left_head | left_tail] = left
    [right_head | right_tail] = right
    new_total = abs(left_head - right_head) + total
    calc_distance(left_tail, right_tail, new_total)
  end

  def compute(file_name) do
    {:ok, content} = read_input(file_name)
    lines = get_lines(content)
    { left, right } = create_lists(lines, [])
    sorted_left = Enum.sort(left)
    sorted_right = Enum.sort(right)
    calc_distance(sorted_left, sorted_right)
  end
end
