//
//  AuthFeatureCoordinatorProtocol.swift
//  Auth
//
//  Created by Иван Карплюк on 20.02.2025.
//

import Foundation


public protocol AuthFeatureCoordinatorProtocol: AnyObject {
    /// Переходит к экрану подтверждения почты.
    func showEmailConfirmation()
    /// Переходит к экрану логина.
    func showLogin()
    /// Переходит в основной поток (например, после успешного входа).
    func showMainFlow()
    /// Возвращает к экрану регистрации.
    func showRegistration()
}
