//
//  CoordinatorFactory.swift
//  Product
//
//  Created by Иван Карплюк on 20.02.2025.
//

import UIKit
import Platform
import Auth


/// Протокол фабрики координаторов, определяющий методы создания модульных координаторов.
public protocol CoordinatorFactoryProtocol {
    /// Создаёт координатор для Onboarding.
    ///
    /// - Parameter navigationController: UINavigationController для отображения Onboarding flow.
    /// - Returns: Координатор, отвечающий за Onboarding.
    func makeOnboardingCoordinator(navigationController: UINavigationController) -> Coordinator
    
    /// Создаёт координатор для Auth.
    ///
    /// - Parameter navigationController: UINavigationController для отображения Auth flow.
    /// - Returns: Координатор, отвечающий за Auth.
    func makeAuthCoordinator(navigationController: UINavigationController) -> Coordinator
    
    /// Создаёт координатор для основного потока.
    ///
    /// - Parameters:
    ///   - navigationController: UINavigationController для отображения основного потока.
    ///   - initialScreen: Начальный экран в TabBar.
    /// - Returns: Координатор для основного функционала.
    func makeMainFlowCoordinator(navigationController: UINavigationController, initialScreen: DeepLink.MainFlowScreen) -> Coordinator
}

public class CoordinatorFactory: CoordinatorFactoryProtocol {
    public init() { }
    

    public func makeAuthCoordinator(navigationController: UINavigationController) -> Coordinator {
        return AuthCoordinator(navigationController: navigationController)
    }

}
