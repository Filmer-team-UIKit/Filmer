import ProjectDescription
import ProjectDescriptionHelpers


let project = Project(
    name: "Auth",
    targets: [
        .target(
            name: "Auth",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.Auth",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            scripts: [Project.getLinterScripts()],
            dependencies: [
                .project(target: "Product", path: "../../Product"),
                .project(target: "SharedResources", path: "../../SharedResources"),

            ]
        ),
    ]
)
