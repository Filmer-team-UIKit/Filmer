//
//  RegistrationScreenAssembly.swift.swift
//  Auth
//
//  Created by Иван Карплюк on 20.02.2025.
//

import UIKit
import Product

public class RegistrationModuleAssembly {
    /// Собирает RegistrationViewController.
    /// - Parameters:
    ///   - navigationController: UINavigationController для отображения экрана.
    ///   - coordinator: Экземпляр AuthFlowCoordinatorProtocol для управления переходами.
    /// - Returns: Готовый RegistrationViewController.
    public static func assemble(with navigationController: UINavigationController,
                                coordinator: AuthFlowCoordinatorProtocol) -> RegistrationViewController {
        let viewController = RegistrationViewController()
        let useCase = RegistrationUseCase(registrationService: MockRegistrationService())
        let router = RegistrationRouter(coordinator: coordinator)
        let presenter = RegistrationPresenter(view: viewController, registrationUseCase: useCase, router: router)
        viewController.presenter = presenter
        return viewController
    }
}
