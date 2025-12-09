protocol Day {
    var day: Int { get }
    var year: Int { get }
    
    func part1() -> String
    func part2() -> String
}

extension Day {
    func run() {
        print("🎄 Year \(year) - Day \(day) 🎄")
        print("Part 1: \(part1())")
        print("Part 2: \(part2())")
        print("---")
    }
}
