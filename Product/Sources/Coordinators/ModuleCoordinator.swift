//
//  ModuleCoordinator.swift
//  Platform
//
//  Created by Иван Карплюк on 25.02.2025.
//

import UIKit
import Platform

/// Протокол модульного координатора, который реализуют все координаторы отдельных модулей.
/// AppCoordinator работает с массивом таких координаторов.
public protocol ModuleCoordinator: Coordinator {
    /// Уникальный идентификатор модуля (например, "auth", "onboarding", "mainFlow").
    var moduleIdentifier: String { get }
}
