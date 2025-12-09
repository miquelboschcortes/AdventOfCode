# Day 9: [Puzzle Title]

[Advent of Code 2025 - Day 9](https://adventofcode.com/2025/day/9)

## Problem Summary

### Part 1
1. Parse all points `(x, y)` into an array `points`.

2. For every pair `i < j`:

- Compute
    `let width  = abs(x1 - x2) + 1 let height = abs(y1 - y2) + 1 let area   = width * height`

- Track `bestArea = max(bestArea, area)`.


The **cost** is driven by:
- Number of points = `n`.
- Number of pairs = `n * (n - 1) / 2` ≈ `O(n²)`.

The _magnitude_ of the coordinates (like `98_418, 50_192`) does **not** change complexity; it only affects the numeric types you use (e.g., `Int64` vs `Int` for safety when multiplying).

### Part 2
[Describe part 2]

## Approach

### Part 1
[Explain your approach]

### Part 2
[Explain your approach]

## Learnings

- 
- 

## Notes

[Any interesting observations or edge cases]
