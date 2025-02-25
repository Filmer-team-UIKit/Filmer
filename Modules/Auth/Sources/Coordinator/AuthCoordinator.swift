//
//  AuthCoordinator.swift
//  Auth
//
//  Created by Иван Карплюк on 20.02.2025.
//

import UIKit
import Auth
import Product


public protocol AuthFlowCoordinatorProtocol: ModuleCoordinator {
    /// Переходит к экрану подтверждения почты.
    func showEmailConfirmation()
    /// Переходит к экрану логина.
    func showLogin()
    /// Переходит в основной поток (например, после успешного входа).
    func showMainFlow()
    /// Возвращает к экрану регистрации.
    func showRegistration()
}


/// Реализация координатора модуля Auth, реализующая AuthFlowCoordinatorProtocol.
/// Этот класс находится в модуле Auth.
public class AuthCoordinator: BaseCoordinatorProxy, AuthFlowCoordinatorProtocol {
    public var moduleIdentifier: String { return "auth" }
    
    private let navigationController: UINavigationController
    
    /// Инициализирует AuthCoordinator.
    /// - Parameter navigationController: UINavigationController для навигации в модуле Auth.
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    /// Запускает модуль Auth, по умолчанию показывая экран регистрации.
    public override func start() {
        let registrationVC = RegistrationModuleAssembly.assemble(with: navigationController, coordinator: self)
        navigationController.pushViewController(registrationVC, animated: true)
    }
    
    public func showEmailConfirmation() {
//        let emailConfirmationVC = EmailConfirmationViewController()
//        navigationController.pushViewController(emailConfirmationVC, animated: true)
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
