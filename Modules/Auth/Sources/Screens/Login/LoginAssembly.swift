//
//  LoginAssembly.swift
//  Auth
//
//  Created by Иван Карплюк on 20.02.2025.
//

import UIKit


public class LoginModuleAssembly {
    /// Собирает LoginViewController с его зависимостями.
    /// - Parameters:
    ///   - navigationController: UINavigationController, в который будет встроен экран.
    ///   - coordinator: Координатор модуля Auth для управления переходами.
    /// - Returns: Настроенный LoginViewController.
    public static func assemble(with navigationController: UINavigationController,
                                coordinator: AuthFeatureCoordinatorProtocol) -> LoginViewController {
        let viewController = LoginViewController()
        let useCase = LoginUseCase()
        let router = LoginRouter(coordinator: coordinator)
        let presenter = LoginPresenter(view: viewController,
                                        loginUseCase: useCase,
                                        router: router)
        viewController.presenter = presenter
        return viewController
    }
}
