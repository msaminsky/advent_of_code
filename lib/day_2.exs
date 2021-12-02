# Count the position of your submarine
# https://adventofcode.com/2021/day/1

import HTTPoison
import AdventOfCode

headers = [
  {"cookie", "add_cookies"}
]

{:ok, %HTTPoison.Response{body: body}} =
  HTTPoison.get("https://adventofcode.com/2021/day/2/input", headers)

val_list =
  body
  |> String.trim()
  |> String.split("\n")
  |> Enum.map(fn x -> x |> String.split(" ") end)
  |> Enum.map(fn [dir, val] -> %{dir => String.to_integer(val)} end)

# part 1 - get the product of the final position
AdventOfCode.get_final_position(val_list) |> Map.values() |> Enum.product()

# part 2 - get the product of the final position
AdventOfCode.get_final_position(val_list, :aim)
|> Map.pop(:aim)
|> elem(0)
|> Map.values()
|> Enum.product()
