defmodule Part02 do
  def read_input(file_name) do
    case File.read(file_name) do
      {:ok, content} -> content
      {:error, reason} -> raise "Error reading file: #{reason}"
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

  def count_occurrences_for_num(num, list) do
    Enum.count(list, fn x -> x == num end)
  end

  def count_occurrences({left, right}) do
    right_frequencies = Enum.frequencies(right)
    Enum.reduce(left, 0, fn x, total -> total + x * Map.get(right_frequencies, x, 0) end)
  end

  def compute_similarity_score(file_name) do
    file_name
    |> read_input()
    |> get_lines()
    |> create_lists()
    |> count_occurrences()
  end
end
