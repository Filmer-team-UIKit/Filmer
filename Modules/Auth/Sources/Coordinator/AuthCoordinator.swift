//
//  AuthCoordinator.swift
//  Auth
//
//  Created by Иван Карплюк on 20.02.2025.
//

import UIKit
import Auth
import Platform

/// Координатор модуля Auth, реализующий AuthFeatureCoordinatorProtocol.
/// Отвечает за переключение экранов внутри модуля (Registration, EmailConfirmation, Login, MainFlow).
public class AuthCoordinator: BaseCoordinator, AuthFeatureCoordinatorProtocol {
    private let navigationController: UINavigationController
    
    /// Инициализирует AuthCoordinator.
    /// - Parameter navigationController: UINavigationController для навигации в модуле Auth.
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    /// Запускает модуль Auth, по умолчанию показывая Registration.
    public override func start() {
        let registrationVC = RegistrationModuleAssembly.assemble(with: navigationController, coordinator: self)
        navigationController.pushViewController(registrationVC, animated: true)
    }
    
    public func showEmailConfirmation() {
        
    }
    
    public func showLogin() {
        let loginVC = LoginModuleAssembly.assemble(with: navigationController, coordinator: self)
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    public func showMainFlow() {
        let mainFlowVC = UIViewController()
        mainFlowVC.view.backgroundColor = .systemGreen
        mainFlowVC.title = "Main Flow"
        navigationController.pushViewController(mainFlowVC, animated: true)
    }
    
    public func showRegistration() {
        navigationController.popViewController(animated: true)
    }
}
