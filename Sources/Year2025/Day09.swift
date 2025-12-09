struct Day09: Day {
    let day = 9
    let year = 2025
    let input: String
    
    init() {
        self.input = InputReader.read(year: year, day: day)
    }
    
    private struct Point {
        let x: Int
        let y: Int
    }
    
    private func extractPoints(from input: String) -> [Point] {
        return input
            .split(separator: "\n")
            .compactMap { line in
                let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
                
                if trimmed.isEmpty { return nil }
                
                let parts = trimmed.split(separator: ",")
                
                guard
                    parts.count == 2,
                    let x = Int(parts[0]),
                    let y = Int(parts[1])
                else { return nil }
                
                return Point(x: x, y: y)
            }
    }
    
    
    func part1() -> String {
        
        // area = |x1 - x2| * |y1 - y2|
        
        var bestArea = 0
        
        let points = extractPoints(from: input)
        print(points)
        
        for i in 0..<points.count {
            for j in i+1..<points.count {
                let (x1, y1) = (points[i].x, points[i].y)
                let (x2, y2) = (points[j].x, points[j].y)
                let area = (abs(x1 - x2) + 1) * (abs(y1 - y2)   + 1)
                if area > bestArea {
                    bestArea = area
                }
            }
        }
        
        return String(bestArea)
    }
    
    func part2() -> String {
        
        var bestArea = 0
        
        // 1. Parse all points (x, y) into an array points.
        let points = extractPoints(from: input)
        
        for i in 0..<points.count {
            for j in i+1..<points.count {

                let p = points[i]
                let q = points[j]
                
                let xMin = min(p.x, q.x)
                let xMax = max(p.x, q.x)
                let yMin = min(p.y, q.y)
                let yMax = max(p.y, q.y)

                let width = xMax - xMin + 1
                let height = yMax - yMin + 1
                
                let area = width * height
                
                if area > bestArea {
                    bestArea = area
                }
            }
        }
        
        
        return String(bestArea)
    }
}
