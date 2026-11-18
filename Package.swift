// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Malert",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "Malert", targets: ["Malert"]),
    ],
    targets: [
        .target(
            name: "Malert",
            path: "Malert",
            // Assets only holds the README screenshots, the code doesn't load them
            exclude: ["Assets", "Classes/.gitkeep"],
            sources: ["Classes"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
