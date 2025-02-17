import ProjectDescription

let project = Project(
    name: "Platform",
    targets: [
        .target(
            name: "Platform",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.Platform",
            infoPlist: .default,
            sources: ["./**"],
            resources: [],
            dependencies: [
                .external(name: "Swinject"),
                .external(name: "RealmSwift")
            ]
        )
    ]
)
