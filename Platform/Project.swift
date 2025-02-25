import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Platform",
    targets: [
        .target(
            name: "Platform",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.Platform",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: [],
            scripts: [Project.getLinterScripts()],
            dependencies: [
                .external(name: "Swinject"),
                .external(name: "RealmSwift"),
            ]
        ),
        
            .target(
                name: "PlatformTests",
                destinations: .iOS,
                product: .unitTests,
                bundleId: "io.tuist.PlatformTests",
                infoPlist: .default,
                sources: ["Tests/**"],
                resources: [],
                dependencies: [
                    .target(name: "Platform")
                ]
            ),
    ]
)
