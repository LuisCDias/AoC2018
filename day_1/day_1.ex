defmodule Day1 do
  def exercise_1(line) do
    line
    |> String.split("\n", trim: true)
    |> Enum.map(fn line -> String.to_integer(line) end)
    |> final_frequency(0)
    |> IO.inspect
  end

  def exercise_2(line) do
    IO.inspect("Calculating...")
    line
    |> String.split("\n", trim: true)
    |> Enum.map(fn line -> String.to_integer(line) end)
    |> frequency_until_duplicate_found(0)
    |> IO.inspect
  end

  defp final_frequency([head | tail], current_frequency) do
    new_frequency = current_frequency + head
    final_frequency(tail, new_frequency)
  end

  defp final_frequency([], current_frequency) do
    current_frequency
  end


  defp frequency_until_duplicate_found(list, current_frequency) do
    frequency_until_duplicate_found_recur(list, list, current_frequency, [current_frequency])
  end

  defp frequency_until_duplicate_found_recur(original_input, [head | tail], current_frequency, found) do
    new_frequency = current_frequency + head
    if Enum.member?(found, new_frequency) do
      new_frequency
    else
      frequency_until_duplicate_found_recur(original_input, tail, new_frequency, found ++ [new_frequency])
    end
  end

  defp frequency_until_duplicate_found_recur(original_input, [], current_frequency, found) do
    frequency_until_duplicate_found_recur(original_input, original_input, current_frequency, found)
  end
end

File.read!("input.txt")
# |> Day1.exercise_1
|> Day1.exercise_2
