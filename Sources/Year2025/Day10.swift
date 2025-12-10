struct Day10: Day {
    let day = 10
    let year = 2025
    let input: String
    
    init() {
        self.input = InputReader.read(year: year, day: day)
    }
    
    struct Machine {
        let target: [Int]
        let positions: [[Int]]
    }
    
    func extractTarget(_ line: String) -> [Int] {
        let targetRegex =   #/\[([^\]]*)\]/#
        return line.firstMatch(of: targetRegex)?
            .output.1
            .map { $0 == "#" ? 1 : 0 } ?? []
    }
    
    func extractTargetAndPositions(_ input: String) {
        
        var machines: [Machine] = []
        
        let inputs = input.split(separator: "\n")
            .compactMap { line in
                let pattern = "\\{[^}]*\\}"
                return line.replacingOccurrences(
                    of: pattern,
                    with: "",
                    options: .regularExpression
                )
            }
        
        let positionRegex = #/\(([^)]*)\)/#
        
        for line in inputs {
            
            print(line)
            
            var positions: [[Int]] = []
            
            for match in line.matches(of: positionRegex) {
//                print(match.output.1)
                let numbers = match.output.1
                    .trimmingCharacters(in: .whitespaces)
                    .split(separator: ",")
                    .compactMap { Int($0) }
                
                positions.append(numbers)
            }
            
            machines.append(Machine(target: extractTarget(line), positions: positions))
            
        }
        print(machines)
    }
    
    func part1() -> String {
        
        extractTargetAndPositions(input)
        return "Not implemented"
    }
    
    func part2() -> String {
        // TODO: Solve part 2
        return "Not implemented"
    }
}
