# Day 9: [Puzzle Title]

[Advent of Code 2025 - Day 9](https://adventofcode.com/2025/day/9)

## Problem Summary

### Part 1
Input: a set of red tiles at integer coordinates:

`x1,y1 x2,y2 ... xn,yn`

From the text + examples, we can infer:

- The rectangle edges are **axis-aligned** (sides parallel to the grid).

- You can choose **any two red tiles** as **opposite corners** (diagonal corners).

- The _other_ two corners do **not** need to be red.

- The area is just:

    `area = |x1 - x2| * |y1 - y2|`


Restriction: tiles must actually form a rectangle, so:

- If `x1 == x2` or `y1 == y2`, the “rectangle” is degenerate (zero area line). You can ignore these pairs.


So mathematically, the problem is:

> Given a set of points `(xi, yi)`, find  
> `max over all i < j with xi != xj and yi != yj of |xi - xj| * |yi - yj|`.

### Part 2
[Describe part 2]

## Approach

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
[Explain your approach]

## Learnings

- 
- 

## Notes

[Any interesting observations or edge cases]
