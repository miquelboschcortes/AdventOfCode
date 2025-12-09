#!/bin/bash

DAY="${1}"
YEAR="${2:-2024}"

if [ -z "$DAY" ]; then
    echo "Usage: ./add_day.sh <day_number> [year]"
    exit 1
fi

DAY_PADDED=$(printf "%02d" $DAY)
FILE="Sources/Year$YEAR/Day$DAY_PADDED.swift"
INPUT="Inputs/$YEAR/day$DAY_PADDED.txt"
DOC="Docs/$YEAR/Day$DAY_PADDED.md"

# Ensure directories exist
mkdir -p "Sources/Year$YEAR"
mkdir -p "Inputs/$YEAR"
mkdir -p "Docs/$YEAR"

# Create day file
cat > "$FILE" << EOF
struct Day$DAY_PADDED: Day {
    let day = $DAY
    let year = $YEAR
    let input: String
    
    init() {
        self.input = InputReader.read(year: year, day: day)
    }
    
    func part1() -> String {
        // TODO: Solve part 1
        return "Not implemented"
    }
    
    func part2() -> String {
        // TODO: Solve part 2
        return "Not implemented"
    }
}
EOF

# Create input file
touch "$INPUT"

# Create README for the day
cat > "$DOC" << EOF
# Day $DAY: [Puzzle Title]

[Advent of Code $YEAR - Day $DAY](https://adventofcode.com/$YEAR/day/$DAY)

## Problem Summary

### Part 1
[Describe part 1]

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
EOF

# Update main README with new day entry
if [ -f "README.md" ]; then
    # Check if the line already exists
    if ! grep -q "| \[$DAY_PADDED\]" README.md; then
        # Find the line with <!-- and insert before it
        sed -i.bak "/^<!-- | \[/i\\
| [$DAY_PADDED](Docs/$YEAR/Day$DAY_PADDED.md) | ⭐ | ⭐ | [Puzzle Title] |
" README.md
        rm README.md.bak 2>/dev/null
        echo "📝 Updated README.md with Day $DAY_PADDED"
    fi
fi

echo "✅ Created Day $DAY_PADDED for year $YEAR"
echo "   - $FILE"
echo "   - $INPUT"
echo "   - $DOC"
echo ""
echo "📋 Next steps:"
echo "   1. Add Day$DAY_PADDED() to main.swift"
echo "   2. Paste your puzzle input into $INPUT"
echo "   3. Update $DOC with puzzle details"
