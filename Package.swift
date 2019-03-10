// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BSONMapper",
  products: [
    .library(
      name: "BSONMapper",
      targets: ["BSONMapper"]),
  ],
  dependencies: [
    .package(url: "https://github.com/OpenKitten/BSON.git", from: "6.0.0"),
  ],
  targets: [
    .target(
      name: "BSONMapper",
      dependencies: ["BSON"]),
    .testTarget(
      name: "BSONMapperTests",
      dependencies: ["BSONMapper"]),
  ]
)
