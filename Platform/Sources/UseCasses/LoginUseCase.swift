//
//  LoginUseCase.swift
//  Auth
//
//  Created by Иван Карплюк on 20.02.2025.
//

import UIKit

public protocol LoginUseCaseProtocol {
    /// Выполняет вход пользователя.
    /// - Parameters:
    ///   - user: Модель пользователя.
    ///   - completion: Завершение входа с результатом.
    func login(user: User, completion: @escaping (Result<Void, Error>) -> Void)
}

public class LoginUseCase: LoginUseCaseProtocol {
    public init() { }
    
    public func login(user: User, completion: @escaping (Result<Void, Error>) -> Void) {
        // Имитация входа пользователя.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            completion(.success(()))
        }
    }
}
