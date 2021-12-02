# Count the number of increases in a file
# https://adventofcode.com/2021/day/1

import HTTPoison
import AdventOfCode

headers = [
  {"cookie",
   "_ga=GA1.2.1403425949.1638325856; _gid=GA1.2.564441161.1638325856; session=53616c7465645f5fbbe23b465ef93586b8ebcccf5fd7c8ce6ec8dcb79099c5bbcd12d81a01b9f9c34fc9751071bd53d6"}
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
