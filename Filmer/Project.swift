import ProjectDescription

let project = Project(
    name: "Filmer",
    targets: [
        // Приложение
        .target(
            name: "Filmer",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Filmer",
            infoPlist: .extendingDefault(with: [
                "MinimumOSVersion": "15.0",
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
            dependencies: [
                .project(target: "Product", path: "../Product"),
                .project(target: "Auth", path: "../Modules/Auth"),

                .target(name: "SharedAssets")
            ]
        ),
        // Тесты приложения
        .target(
            name: "FilmerTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.FilmerTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "Filmer")
            ]
        ),
        // Ассеты (Bundle)
        .target(
            name: "SharedAssets",
            destinations: .iOS,
            product: .bundle,
            bundleId: "io.tuist.SharedAssets",
            infoPlist: .default,
            sources: [],
            resources: ["Resources/Assets.xcassets"]
        )
    ]
)
