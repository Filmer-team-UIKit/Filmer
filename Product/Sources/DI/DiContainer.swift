//
//  DiContainer.swift
//  Platform
//
//  Created by Иван Карплюк on 20.02.2025.
//

import Swinject

/// DIContainer отвечает за регистрацию и разрешение зависимостей в приложении.
/// Разделён на две части:
/// - Platform: базовые протоколы (если необходимо)
/// - Product: конкретные реализации, такие как моковый сервис регистрации и use case.
///

public final class DIContainer {
    /// Единственный экземпляр DIContainer.
    public static let shared = DIContainer()
    
    /// Корневой контейнер зависимостей.
    public let container: Container
    
    private init() {
        container = Container()
        registerPlatformDependencies()
        registerProductDependencies()
    }
    
    /// Регистрирует зависимости, определённые на уровне Platform.
    private func registerPlatformDependencies() {
        // Например, можно зарегистрировать базовые протоколы и абстракции.
    }
    
    /// Регистрирует зависимости, специфичные для продукта.
    private func registerProductDependencies() {
        // Регистрируем моковый сервис регистрации.
        container.register(RegistrationServiceProtocol.self) { _ in
            return MockRegistrationService()
        }.inObjectScope(.container)
        
        // Регистрируем use case, внедряя RegistrationService.
        container.register(RegistrationUseCaseProtocol.self) { resolver in
            let service = resolver.resolve(RegistrationServiceProtocol.self)!
            return RegistrationUseCase(registrationService: service)
        }
        
        container.register(LoginUseCaseProtocol.self) { _ in return LoginUseCase()
        }
    }
    
    /// Разрешает зависимость указанного типа.
    /// - Parameter type: Тип зависимости для разрешения.
    /// - Returns: Экземпляр зависимости, если он зарегистрирован.
    public func resolve<T>(_ type: T.Type) -> T? {
        return container.resolve(type)
    }
}
