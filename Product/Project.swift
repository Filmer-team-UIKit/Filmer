import ProjectDescription

let project = Project(
    name: "Product",
    targets: [
        
        .target(
            name: "Product",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.Product",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: [],
            dependencies: [
                .project(target: "Platform", path: "../Platform"),
            ]
        ),
        
        .target(
            name: "ProductTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.ProductTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "Product")
            ]
        )
        
    ]
)
