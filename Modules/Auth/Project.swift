import ProjectDescription

let project = Project(
    name: "Auth",
    targets: [
        .target(
            name: "Auth",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.Auth",
            infoPlist: .default,
            sources: ["./**"],
            dependencies: [
                .project(target: "Product", path: "../../Product"),
                .project(target: "SharedAssets", path: "../../Filmer")
            ]
        )
    ]
)
