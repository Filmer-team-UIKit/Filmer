import ProjectDescription

let swiftLintScript = """
export PATH="/opt/homebrew/bin:$PATH"
if which swiftlint >/dev/null; then
  swiftlint --strict
else
  echo "error: SwiftLint does not exist, download it from https://github.com/realm/SwiftLint"
  exit 1
fi
"""

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
            scripts: [
                .pre(script: swiftLintScript, name: "SwiftLint")
            ],
            dependencies: [
                .project(target: "Product", path: "../Product"),
                .project(target: "Auth", path: "../Modules/Auth"),
                .project(target: "SharedResources", path: "../SharedResources"),
            ]
        ),
    ]
)
