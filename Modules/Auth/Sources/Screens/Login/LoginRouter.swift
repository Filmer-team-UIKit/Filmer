//
//  LoginRouter.swift
//  Auth
//
//  Created by Иван Карплюк on 20.02.2025.
//


import UIKit


public protocol LoginRouterProtocol {
    /// Переходит в основной поток (после успешного входа).
    func navigateToMainFlow()
    /// Возвращается к экрану регистрации.
    func navigateBackToRegistration()
}


/// Реализация роутера для экрана логина, делегирующего переключение экранов координатору.
public class LoginRouter: LoginRouterProtocol {
    private weak var coordinator: AuthFeatureCoordinatorProtocol?
    
    /// Инициализирует LoginRouter.
    /// - Parameter coordinator: Координатор модуля Auth для управления переходами.
    public init(coordinator: AuthFeatureCoordinatorProtocol?) {
        self.coordinator = coordinator
    }
    
    public func navigateToMainFlow() {
        coordinator?.showMainFlow()
    }
    
    public func navigateBackToRegistration() {
        coordinator?.showRegistration()
    }
}
