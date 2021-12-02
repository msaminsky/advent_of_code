# Count the number of increases in a file
# https://adventofcode.com/2021/day/1

import HTTPoison
import AdventOfCode

headers = [
  {"cookie", "add_cookies_here"}
]

{:ok, %HTTPoison.Response{body: body}} =
  HTTPoison.get("https://adventofcode.com/2021/day/1/input", headers)

val_list = body |> String.trim() |> String.split("\n") |> Enum.map(&String.to_integer(&1))

# part 1 - compare each val to the preceding
val_list |> AdventOfCode.count_increases()

# part 2 - sliding window of 3
val_list
|> Enum.chunk_every(3, 1)
|> Enum.map(&Enum.sum(&1))
|> AdventOfCode.count_increases()
