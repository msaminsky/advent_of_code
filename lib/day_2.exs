# Count the position of your submarine
# https://adventofcode.com/2021/day/2

import AdventOfCode

auth_header = Application.get_env(:advent_of_code, :auth)
url = "https://adventofcode.com/2021/day/2/input"

val_list =
  AdventOfCode.get_input_file(url, auth_header)
  |> AdventOfCode.list_from_input_data()
  |> Enum.map(fn x -> x |> String.split(" ") end)
  |> Enum.map(fn [dir, val] -> %{dir => String.to_integer(val)} end)

# part 1 - get the product of the final position
AdventOfCode.get_final_position(val_list)
|> Map.values()
|> Enum.product()

# part 2 - get the product of the final position
AdventOfCode.get_final_position(val_list, :aim)
|> Map.pop(:aim)
|> elem(0)
|> Map.values()
|> Enum.product()
