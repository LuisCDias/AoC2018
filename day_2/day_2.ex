defmodule Day2 do
  def exercise_1(line) do
    lines = String.split(line, "\n", trim: true)
    two_of_any_letter = count_occurences(lines, 2)
    three_of_any_letter = count_occurences(lines, 3)

    two_of_any_letter * three_of_any_letter
    |> IO.inspect
  end

  def string_to_char_map(line) do
    line
    |> String.graphemes()
    |> reduce_chars
  end

  def count_occurences(lines, n) do
    lines
    |> Enum.map(fn line -> string_to_char_map(line) end)
    |> Enum.map(fn map -> :maps.filter fn _, v -> v == n end, map end)
    |> Enum.reject(fn map -> Enum.empty?(map) end)
    |> Enum.count
  end

  defp reduce_chars(chars_list) do
    chars_list
    |> Enum.reduce(%{}, fn char, acc -> Map.update(acc, char, 1, &(&1 + 1)) end)
  end
end

File.read!("input.txt")
|> Day2.exercise_1
