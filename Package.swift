// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Blackjack",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Blackjack",
            targets: ["Blackjack"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/paciej00/PlayingCards.git", from: "0.0.1"),
        .package(url: "https://github.com/paciej00/Shuffling.git", from: "0.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Blackjack",
            dependencies: ["PlayingCards", "Shuffling"]),
        .testTarget(
            name: "BlackjackTests",
            dependencies: ["Blackjack"]),
    ]
)
