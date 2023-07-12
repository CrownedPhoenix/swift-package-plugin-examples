import ArgumentParser

@main
struct Palpatine: ParsableCommand {
    static var configuration = CommandConfiguration(
        subcommands: [
            Execute.self
        ]
    )
}

struct Execute: ParsableCommand {
    static var configuration = CommandConfiguration(
        subcommands: [
            Order.self
        ]
    )
}

struct Order: ParsableCommand {

    @Argument
    var order: UInt

    func run() throws {
        print("Executing order \(order): Unlimited power!")
    }
}
