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
