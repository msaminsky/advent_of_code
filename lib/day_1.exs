# Count the number of increases in a file
# https://adventofcode.com/2021/day/1

import AdventOfCode

auth_header = Application.get_env(:advent_of_code, :auth)
url = "https://adventofcode.com/2021/day/1/input"

val_list =
  AdventOfCode.get_input_file(url, auth_header)
  |> AdventOfCode.list_from_input_data()
  |> Enum.map(&String.to_integer(&1))

# part 1 - compare each val to the preceding
val_list
|> AdventOfCode.count_increases()

# part 2 - sliding window of 3
val_list
|> Enum.chunk_every(3, 1)
|> Enum.map(&Enum.sum(&1))
|> AdventOfCode.count_increases()
