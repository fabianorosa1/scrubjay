// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Scrubjay",
    platforms: [
        .macOS(.v10_12)],
    products: [
        .executable(name: "scrubjay", targets: ["scrubjay"]),
        .library(name: "ScrubjayCore", type: .dynamic, targets: ["ScrubjayCore"]),
        .library(name: "ScrubjayUML", type: .dynamic, targets: ["ScrubjayUML"])
        ],
    dependencies: [
        .package(url: "https://github.com/jpsim/SourceKitten", .exact("0.23.0")),
        .package(url: "https://github.com/apple/swift-syntax.git", .exact("0.50000.0")),
        .package(url: "https://github.com/apple/swift-package-manager.git", from: "0.3.0"),
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "scrubjay",
            dependencies: ["ScrubjayCore"]),
        .target(
            name: "ScrubjayUML",
            dependencies: []),
        .target(
            name: "ScrubjayCore",
            dependencies: ["SourceKittenFramework", "SwiftSyntax", "Utility", "ScrubjayUML"]),
        .testTarget(
            name: "ScrubjayTests",
            dependencies: ["scrubjay"]),
        ]
)
