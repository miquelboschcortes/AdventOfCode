# AdventOfCode

Advent of Code solutions in Swift

## Structure

- `Sources/Year2025/` - Daily solutions
- `Sources/Utilities/` - Helper code
- `Inputs/2025/` - Puzzle inputs

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

Or manually:
1. Copy `Day01.swift` to `Day##.swift`
2. Update day number
3. Create `Inputs/2025/day##.txt`
4. Add to `main.swift`
