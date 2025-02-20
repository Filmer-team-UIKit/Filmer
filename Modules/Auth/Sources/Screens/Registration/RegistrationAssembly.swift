//
//  RegistrationScreenAssembly.swift.swift
//  Auth
//
//  Created by Иван Карплюк on 20.02.2025.
//

import UIKit


public class RegistrationModuleAssembly {
    public static func assemble(with navigationController: UINavigationController,
                                coordinator: AuthFeatureCoordinatorProtocol) -> RegistrationViewController {
        let viewController = RegistrationViewController()
        let useCase = DIContainer.shared.resolve(RegistrationUseCaseProtocol.self)!
        let router = RegistrationRouter(coordinator: coordinator)
        let presenter = RegistrationPresenter(view: viewController,
                                                registrationUseCase: useCase,
                                                router: router)
        viewController.presenter = presenter
        return viewController
    }
}
