defmodule AdventOfCode do
  @moduledoc """
  Documentation for `AdventOfCode`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AdventOfCode.hello()
      :world

  """
  def hello do
    :world
  end

  def get_final_position(enum) do
    Enum.reduce(
      enum,
      %{current_x: 0, current_y: 0},
      fn x, acc ->
        case x do
          %{"up" => val} -> %{current_x: acc.current_x, current_y: acc.current_y - val}
          %{"down" => val} -> %{current_x: acc.current_x, current_y: acc.current_y + val}
          %{"forward" => val} -> %{current_x: acc.current_x + val, current_y: acc.current_y}
          _ -> acc
        end
      end
    )
  end

  def get_final_position(enum, :aim) do
    Enum.reduce(
      enum,
      %{current_x: 0, current_y: 0, aim: 0},
      fn x, acc ->
        case x do
          %{"up" => val} ->
            Process.sleep(5)

            %{current_x: acc.current_x, current_y: acc.current_y, aim: acc.aim - val}
            |> IO.inspect()

          %{"down" => val} ->
            Process.sleep(5)

            %{current_x: acc.current_x, current_y: acc.current_y, aim: acc.aim + val}
            |> IO.inspect()

          %{"forward" => val} ->
            Process.sleep(5)

            %{
              current_x: acc.current_x + val,
              current_y: acc.current_y + acc.aim * val,
              aim: acc.aim
            }
            |> IO.inspect()

          _ ->
            acc
        end
      end
    )
  end

  def count_increases(enum) do
    Enum.reduce(
      enum,
      %{last_val: 0, number_of_increases: 0},
      fn x, acc ->
        cond do
          acc.last_val == 0 ->
            %{last_val: x, number_of_increases: 0} |> IO.inspect()

          x > acc.last_val ->
            %{last_val: x, number_of_increases: acc.number_of_increases + 1}
            |> IO.inspect()

          true ->
            %{last_val: x, number_of_increases: acc.number_of_increases}
            |> IO.inspect()
        end
      end
    )
  end
end
