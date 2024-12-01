defmodule Part01 do
  def read_input(file_name) do
    case File.read(file_name) do
      {:ok, content} -> content
      {:error, reason} -> raise "Failed to read file: #{reason}"
    end
  end

  def get_lines(input) do
    String.split(input, ["\n"], trim: true)
  end

  def make_int(string) do
    String.to_integer(string)
  end

  def create_lists(lines) do
    Enum.reduce(lines, {[], []}, fn line, {left, right} ->
      [l, r] = String.split(line, " ", trim: true)
      {[make_int(l) | left], [make_int(r) | right]}
    end)
  end

  def calc_distance(left, right) do
    Enum.zip(left, right)
    |> Enum.reduce(0, fn {l, r}, acc -> acc + abs(l - r) end)
  end

  def calc_distance(left, right, total) do
    [left_head | left_tail] = left
    [right_head | right_tail] = right
    new_total = abs(left_head - right_head) + total
    calc_distance(left_tail, right_tail, new_total)
  end

  def compute(file_name) do
    file_name
    |> read_input()
    |> get_lines()
    |> create_lists()
    |> then(fn {left, right} ->
      left_sorted = Enum.sort(left)
      right_sorted = Enum.sort(right)
      calc_distance(left_sorted, right_sorted)
    end)
  end
end
