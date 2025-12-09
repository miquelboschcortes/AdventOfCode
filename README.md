# AdventOfCode

Advent of Code solutions in Swift

## Structure

- `Sources/Year2024/` - Daily solutions
- `Sources/Utilities/` - Helper code
- `Inputs/2024/` - Puzzle inputs
- `Docs/2024/` - Daily writeups and notes

## Progress - 2025

| Day | Part 1 | Part 2 | Notes |
|-----|--------|--------|-------|
| [09](Docs/2025/Day09.md) | ⭐ | ⭐ | [Puzzle Title] |
<!-- | [02](Docs/2024/Day02.md) | ⭐ | ⭐ | [Puzzle Title] | -->

## Usage

### With Xcode:
1. Open Package.swift in Xcode: `open Package.swift`
2. Edit Scheme → Options → Set working directory to project root
3. Run with Cmd+R

### With Command Line:
```bash
swift run
```

## Adding New Days

Run the helper script:
```bash
./add_day.sh <day_number> [year]
```

This creates:
- Solution file: `Sources/Year2024/Day##.swift`
- Input file: `Inputs/2024/day##.txt`
- README: `Docs/2024/Day##.md`
- Updates progress table in this README

Then:
1. Add `Day##()` to `main.swift`
2. Paste your puzzle input
3. Fill in the day's README with your notes
