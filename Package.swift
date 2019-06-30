// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "swift-c-playground",
    dependencies: [
        // Subpackage is not a good practice and "Subpackage" directory has no meaning for the SPM. I do recommend to store local packages outside each other's directories. SPM does not allow local packages to be set as editable and I want to keep both in one repo for convinience.
        .package(path: "Subpackage/CswiftLib")
    ],
    targets: [
        .target(
            name: "swift-c-playground",
            dependencies: ["CswiftLib"]),
        .testTarget(
            name: "swift-c-playgroundTests",
            dependencies: ["swift-c-playground"]),
    ]
)