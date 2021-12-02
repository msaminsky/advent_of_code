defmodule AdventOfCode do
  @moduledoc """
  Documentation for `AdventOfCode`.
  """

  @doc """
  Functions for handling advent of code challenges

  """
  import HTTPoison

  def get_input_file(url, headers) do
    headers = [
      headers
    ]

    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url, headers)

    body
  end

  def list_from_input_data(request_body) do
    request_body
    |> String.trim()
    |> String.split("\n")
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
