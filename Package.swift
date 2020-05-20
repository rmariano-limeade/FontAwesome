// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "FontAwesome.swift",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .executable(name: "tools", targets: ["tools"]),
        .library(
            name: "FontAwesome.swift",
            targets: ["FASCore", "FASUIKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/jakeheis/SwiftCLI", from: "6.0.0")
    ],
    targets: [
        .target(name: "tools", dependencies: ["SwiftCLI"], path: "Sources/FASTools"),
        .target(
            name: "FASCore",
            dependencies: []
        ),
        .target(
            name: "FASUIKit",
            dependencies: ["FASCore"]
        )
    ]
)
