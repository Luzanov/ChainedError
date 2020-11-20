// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ChainedError",
    products: [
        .library(name: "ChainedError", targets: ["ChainedError"])
    ],
    targets: [
        .target(name: "ChainedError")
    ]
)
