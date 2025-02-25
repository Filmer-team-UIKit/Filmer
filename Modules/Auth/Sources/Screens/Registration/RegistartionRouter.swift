//
//  RegistartionRouter.swift
//  Auth
//
//  Created by Иван Карплюк on 20.02.2025.
//

import UIKit

public protocol RegistrationRouterProtocol {
    func navigateToEmailConfirmation()
    func navigateToLogin()
}

public class RegistrationRouter: RegistrationRouterProtocol {
    private weak var coordinator: AuthFlowCoordinatorProtocol?
    
    public init(coordinator: AuthFlowCoordinatorProtocol?) {
        self.coordinator = coordinator
    }
    
    public func navigateToEmailConfirmation() {
        coordinator?.showEmailConfirmation()
    }
    
    public func navigateToLogin() {
        coordinator?.showLogin()
    }
}
