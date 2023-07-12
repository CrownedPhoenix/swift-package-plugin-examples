import PackagePlugin

@main
struct Chancellor: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        print("I am the Senate!")
    }
}
