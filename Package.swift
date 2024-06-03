//
//  Package.swift
//  JSONCodable
//
//  Created by ChiaYu Chang on 2024/6/3.
//

// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "JSONCodable",
    platforms: [
        .macOS(.v10_14), .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "JSONCodable",
            targets: ["JSONCodable"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "JSONCodable",
            exclude: ["README.md"],
            resources: [
            ]
        ),
        .binaryTarget(
            name: "JSONCodable",
            url: "https://github.com/ChiaYuYuChia/JSONCodable/archive/refs/tags/v1.0.0.zip",
            checksum: "The checksum of the XCFramework inside the ZIP archive."
        )
    ]
)
