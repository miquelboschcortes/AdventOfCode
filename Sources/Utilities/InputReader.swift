import Foundation

struct InputReader {
    static func read(year: Int, day: Int) -> String {
        let fileName = String(format: "day%02d", day)
        let path = "Inputs/\(year)/\(fileName).txt"
        
        // Get the project directory
        let fileURL = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent(path)
        
        guard let content = try? String(contentsOf: fileURL, encoding: .utf8) else {
            fatalError("Could not read file at \(fileURL)")
        }
        
        return content.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
