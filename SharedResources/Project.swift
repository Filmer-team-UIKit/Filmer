import ProjectDescription

let project = Project(
    name: "SharedResources",
    targets: [
        .target(
            name: "SharedResources",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.SharedResources",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .default,
            resources: ["Resources/SharedAssets.xcassets"]
        )
    ]
)
