import PackagePlugin
import Foundation

@main
struct BobTheBuilder: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let outputFile = context.pluginWorkDirectory.appending("Bridge.swift")
        return [
            .buildCommand(
                displayName: "Bob the Builder",
                executable: try context.tool(named: "HandyManny").path,
                arguments: [
                    outputFile,
                    "--build",
                    "Bridge",
                    "Building"
                ],
                outputFiles: [outputFile]
            )
        ]
    }
}
