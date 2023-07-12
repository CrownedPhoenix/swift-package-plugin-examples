import ArgumentParser
import Foundation

@main
struct HandyManny: ParsableCommand {

    @Option(name: .customLong("build"), parsing: .upToNextOption)
    var directives: [String]

    @Argument
    var outputURL: URL

    func run() throws {
        if !directives.isEmpty {
            debugPrint("Handy Manny here. Building \(directives.joined(separator: ", "))...")

                try directives
                .map({ "struct \($0) {}" })
                .joined(separator: "\n")
                .data(using: .utf8)?.write(to: outputURL)
            debugPrint("Done!")
        } else {
            debugPrint("Handy Manny here. You break it, we fix it!")
        }
    }

}

extension URL: ExpressibleByArgument {
    public init?(argument: String) {
        self.init(fileURLWithPath: argument)
    }
}
