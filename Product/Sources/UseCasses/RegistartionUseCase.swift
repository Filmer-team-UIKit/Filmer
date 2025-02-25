//
//  RegistartionUseCase.swift
//  Auth
//
//  Created by Иван Карплюк on 20.02.2025.
//

import Foundation

public protocol RegistrationUseCaseProtocol {
    /// Регистрирует пользователя.
    /// - Parameters:
    ///   - user: Модель пользователя.
    ///   - completion: Завершение регистрации с результатом.
    func register(user: User, completion: @escaping (Result<Void, Error>) -> Void)
}


/// Конкретная реализация сценария регистрации.
public class RegistrationUseCase: RegistrationUseCaseProtocol {
    private let registrationService: RegistrationServiceProtocol
    
    /// Инициализирует RegistrationUseCase с внедряемым сервисом регистрации.
    /// - Parameter registrationService: Сервис, реализующий RegistrationServiceProtocol.
    public init(registrationService: RegistrationServiceProtocol) {
        self.registrationService = registrationService
    }
    
    public func register(user: User, completion: @escaping (Result<Void, Error>) -> Void) {
        registrationService.register(user: user, completion: completion)
    }
}
