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

echo "✅ Created Day $DAY_PADDED"
echo "   - $FILE"
echo "   - $INPUT"
echo ""
echo "Don't forget to:"
echo "   1. Add Day$DAY_PADDED() to main.swift"
echo "   2. Paste your puzzle input into $INPUT"
