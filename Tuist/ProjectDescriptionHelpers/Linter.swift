//
//  Linter.swift
//  Manifests
//
//  Created by Иван Карплюк on 25.02.2025.
//

import ProjectDescription

public let swiftLintScript = """
export PATH="/opt/homebrew/bin:$PATH"
if which swiftlint >/dev/null; then
  swiftlint --strict
else
  echo "error: SwiftLint does not exist, download it from https://github.com/realm/SwiftLint"
  exit 1
fi
"""

public extension Project {
    static func getLinterScripts() -> TargetScript {
        .pre(script: swiftLintScript, name: "SwiftLint")
    }
}
