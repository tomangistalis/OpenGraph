// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "OpenGraph",
    platforms: [
            .macOS(.v10_10), .iOS(.v10), .tvOS(.v9), .watchOS(.v2)
    ],
    products: [
        .library(name: "OpenGraph", targets: ["OpenGraph"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "OpenGraph",
            dependencies: [],
            path: "Sources/OpenGraph",
            exclude: ["Info.plist"]
        ),
//         .testTarget(
//            name: "OpenGraphTests",
//            dependencies: ["OpenGraph"]
//        ),
    ],
    swiftLanguageVersions: [.v5]
)
