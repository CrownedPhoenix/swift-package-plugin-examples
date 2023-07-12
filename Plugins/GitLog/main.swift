import PackagePlugin
import Foundation

@main
struct GitCheck: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let outputFile = context.package.directory.appending("CHANGELOG.md")

        return [
            // We use the underbar version to get access to `workingDirectory`
            ._prebuildCommand(
                displayName: "GitLog",
                executable: try context.tool(named: "git").path,
                arguments: [
                    "log",
                    "--decorate",
                    "--graph",
                    "--output",
                    outputFile.string
                ],
                workingDirectory: context.package.directory,
                outputFilesDirectory: outputFile
            )
        ]
    }
}
