import ProjectDescription

let project = Project(
    name: "Product",
    targets: [
        .target(
            name: "Product",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.Product",
            infoPlist: .default,
            sources: ["./**"],
            resources: [],
            dependencies: [
                .project(target: "Platform", path: "../Platform"),
                .external(name: "Swinject"),
                .external(name: "RealmSwift"),
                .project(target: "SharedAssets", path: "../Filmer")
            ]
        )
    ]
)
