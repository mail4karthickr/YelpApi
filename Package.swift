// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YelpApi",
    platforms: [
      .iOS(.v14),
    ],
    products: [
        .library(name: "YelpClient", targets: ["YelpClient"]),
        .library(name: "YelpClientLive", targets: ["YelpClientLive"]),
        .library(name: "Common", targets: ["Common"]),
        .library(name: "CategoriesFeature", targets: ["CategoriesFeature"]),
        .library(name: "BusinessSearchFeature", targets: ["BusinessSearchFeature"]),
        .library(name: "EventsFeature", targets: ["EventsFeature"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(name: "YelpClient", dependencies: []),
        .target(name: "YelpClientLive", dependencies: ["YelpClient"]),
        .target(name: "Common", dependencies: ["YelpClient", "YelpClientLive"]),
        .target(name: "CategoriesFeature", dependencies: ["Common"]),
        .target(name: "BusinessSearchFeature", dependencies: ["Common"]),
        .target(name: "EventsFeature", dependencies: ["Common"]),
    ]
)
