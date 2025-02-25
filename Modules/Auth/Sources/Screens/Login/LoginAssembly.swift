//
//  LoginAssembly.swift
//  Auth
//
//  Created by Иван Карплюк on 20.02.2025.
//

import UIKit
import Product

public class LoginModuleAssembly {
    /// Собирает LoginViewController.
    /// - Parameters:
    ///   - navigationController: UINavigationController для отображения экрана.
    ///   - coordinator: Экземпляр AuthFlowCoordinatorProtocol для управления переходами.
    /// - Returns: Готовый LoginViewController.
    public static func assemble(with navigationController: UINavigationController,
                                coordinator: AuthFlowCoordinatorProtocol) -> LoginViewController {
        let viewController = LoginViewController()
        let useCase = LoginUseCase()  // Можно заменить на реализацию через DI
        let router = LoginRouter(coordinator: coordinator)
        let presenter = LoginPresenter(view: viewController, loginUseCase: useCase, router: router)
        viewController.presenter = presenter
        return viewController
    }
}
