// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Pluggy",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Pluggy",
            targets: ["Pluggy"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", "1.2.2"..<"2.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Pluggy",
            plugins: [
                .plugin(name: "BobTheBuilder"),
                .plugin(name: "GitLog")
            ]
        ),
        .testTarget(
            name: "PluggyTests",
            dependencies: ["Pluggy"]),

        // Plugins

        // MARK: Chancellor / Palpatine
        .plugin(
            // The plugin name is used to locate the `main`
            // for the plugin, which defaults to `Plugins/<name>/main.swift`
            name: "Chancellor",
            // The `capability` lets us specify whether
            // this will be a `command` plugin or a `build` plugin
            capability: .command(intent: .custom(
                // The verb is passed to `swift package plugin <verb>` to
                // invoke the plugin.
                verb: "execute",
                description: "Execute a command as the Chancellor.")
            ),
            dependencies: [
                // We must add our new executable
                // as a dependency or the plugin
                // will fail when we attempt to run it
                // since it won't be able to locate the
                // `Palpatine` tool from the package context.
                "Palpatine"
            ]
        ),
        .executableTarget(
            name: "Palpatine",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),

        // MARK: BobTheBuilder / HandyManny
        .plugin(
            name: "BobTheBuilder",
            capability: .buildTool(),
            dependencies: [
                "HandyManny"
            ]
        ),

        // We'll pretend that BobTheBuilder contracts out to Handy Manny
        .executableTarget(
            name: "HandyManny",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),

        // MARK: GitLog
        .plugin(
            name: "GitLog",
            capability: .buildTool(),
            dependencies: [
                "HandyManny"
            ]
        ),
    ]
)
