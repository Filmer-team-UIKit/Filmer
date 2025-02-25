//
//  RegistrationServiceProtocol.swift
//  Platform
//
//  Created by Иван Карплюк on 20.02.2025.
//

public protocol RegistrationServiceProtocol {
    /// Регистрирует пользователя.
    /// - Parameters:
    ///   - user: Модель пользователя.
    ///   - completion: Завершение регистрации с результатом.
    func register(user: User, completion: @escaping (Result<Void, Error>) -> Void)
}
