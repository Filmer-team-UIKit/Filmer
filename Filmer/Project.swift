import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Filmer",
    targets: [
        .target(
            name: "Filmer",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Filmer",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .extendingDefault(with: [
                "UILaunchStoryboardName": "LaunchScreen",
                "UIApplicationSceneManifest": [
                    "UIApplicationSupportsMultipleScenes": false,
                    "UISceneConfigurations": [
                        "UIWindowSceneSessionRoleApplication": [
                            [
                                "UISceneConfigurationName": "Default Configuration",
                                "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                            ]
                        ]
                    ]
                ]
            ]),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            scripts: [Project.getLinterScripts()],
            dependencies: [
                .project(target: "Product", path: "../Product"),
                .project(target: "Auth", path: "../Modules/Auth"),
                .project(target: "SharedResources", path: "../SharedResources")
            ]
        )
    ]
)
