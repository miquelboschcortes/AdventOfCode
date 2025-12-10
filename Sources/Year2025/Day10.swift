struct Day10: Day {
    let day = 10
    let year = 2025
    let input: String
    
    init() {
        self.input = InputReader.read(year: year, day: day)
    }
    
    struct Machine {
        let target: [Int]
        let buttons: [[Int]]
    }
    
    func extractTarget(_ line: String) -> [Int] {
        let targetRegex =   #/\[([^\]]*)\]/#
        return line.firstMatch(of: targetRegex)?
            .output.1
            .map { $0 == "#" ? 1 : 0 } ?? []
    }
    
    func extractTargetAndPositions(_ input: String) -> [Machine] {
        
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
                let numbers = match.output.1
                    .trimmingCharacters(in: .whitespaces)
                    .split(separator: ",")
                    .compactMap { Int($0) }
                
                positions.append(numbers)
            }
            
            machines.append(
                Machine(
                    target: extractTarget(line),
                    buttons: positions
                )
            )
        }
        
        return machines
    }
    
    func encodeState(_ state: [Int]) -> String {
        String(state.map { Character("\($0)") })
    }
    
    func toggledState(_ currentState: [Int], using button: [Int]) -> [Int] {
        var result = currentState
        for i in button {
            result[i] = 1 - result[i]
        }
        return result
    }
    
    func minPressesBFS(for machine: Machine) -> Int {
        let target = machine.target
        let buttons = machine.buttons
        let targetLength = target.count
        
        let start = Array(repeating: 0, count: targetLength)
        
        if start == target {
            return 0
        }
        
        var queue: [(state: [Int], distance: Int)] = []
        var head = 0
        
        var visited: Set<String> = []
        let startKey = encodeState(start)
        
        queue.append((start, 0))
        visited.insert(startKey)
        
        while head < queue.count {
            
            let (currentState, distance) = queue[head]
            head += 1
            
            for button in buttons {
                let next = toggledState(currentState, using: button)
                
                if next == target {
                    return distance + 1
                }
                
                let key = encodeState(next)
                if !visited.contains(key) {
                    visited.insert(key)
                    queue.append((next, distance + 1))
                }
            }
        }
        
        return -1
    }
    
    func totalMinPresses(for machines: [Machine]) -> Int {
        machines.reduce(0) { $0 + minPressesBFS(for: $1) }
    }
    
    func part1() -> String {
        let machines = extractTargetAndPositions(input)
        return String(totalMinPresses(for: machines))
    }
    
    func part2() -> String {
        // TODO: Solve part 2
        return "Not implemented"
    }
}
