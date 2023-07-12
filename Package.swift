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
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Pluggy"),
        .testTarget(
            name: "PluggyTests",
            dependencies: ["Pluggy"]),

        // Plugins

        // MARK: Chancellor
            .plugin(
                // The plugin name is used to locate the `main`
                // for the plugin, which defaults to `Plugins/<name>/main.swift`
                name: "Chancellor",
                // The `capability` lets us specify whether
                // this will be a `command` plugin or a `build` plugin
                capability: .command(intent: .custom(
                    // The verb is passed to `swift package plugin <verb>` to
                    // invoke the plugin.
                    verb: "arrest-chancellor",
                    description: "Arrest the Chancellor.")
                ),
                dependencies: [
                    "Pluggy"
                ]
            )
    ]
)
