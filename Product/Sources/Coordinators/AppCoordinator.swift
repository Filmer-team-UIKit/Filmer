//
//  AppCoordinator.swift
//  Product
//
//  Created by Иван Карплюк on 20.02.2025.
//

import UIKit
import Platform

/// Главный координатор приложения, отвечающий за создание окна, настройку корневого UINavigationController
/// и запуск первичного навигационного потока.
///
/// AppCoordinator использует фабрику координаторов для создания модульных flow'ов (onboarding, auth, main flow).
public class AppCoordinator: BaseCoordinator {
    /// Главное окно приложения.
    public let window: UIWindow
    /// Корневой UINavigationController для отображения навигационных потоков.
    private let rootNavigationController: UINavigationController
    /// Фабрика координаторов для создания модульных потоков.
    private let coordinatorFactory: CoordinatorFactoryProtocol
    
    /// Инициализирует AppCoordinator.
    ///
    /// - Parameters:
    ///   - window: Главное окно приложения.
    ///   - coordinatorFactory: Фабрика координаторов для создания модульных потоков.
    public init(window: UIWindow, coordinatorFactory: CoordinatorFactoryProtocol) {
        self.window = window
        self.coordinatorFactory = coordinatorFactory
        self.rootNavigationController = UINavigationController()
        super.init()
    }
    
    /// Запускает основной поток приложения:
    /// - Устанавливает корневой контроллер окна.
    /// - Запускает начальный модуль (например, onboarding).
    public override func start() {
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
        
        // Пример логики: если пользователь новый – запускаем onboarding.
        startOnboardingFlow()
    }
    
    /// Обрабатывает входящие deep link'и на уровне приложения.
    ///
    /// Сначала делегирует deep link дочерним координаторам, а затем инициирует нужный flow.
    ///
    /// - Parameter deepLink: Входящий deep link.
    /// - Returns: `true`, если deep link был обработан.
    public override func handle(deepLink: DeepLink?) -> Bool {
        guard let deepLink = deepLink else { return false }
        
        if super.handle(deepLink: deepLink) {
            return true
        }
        
        switch deepLink {
        case .onboarding:
            startOnboardingFlow()
            return true
        case .auth:
            startAuthFlow()
            return true
        case .mainFlow(let screen):
            startMainFlow(initialScreen: screen)
            return true
        }
    }
    
    // MARK: - Приватные методы запуска модульных потоков
    
    /// Запускает поток Onboarding.
    private func startOnboardingFlow() {
        let onboardingCoordinator = coordinatorFactory.makeOnboardingCoordinator(navigationController: rootNavigationController)
        addChild(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    /// Запускает поток Auth.
    private func startAuthFlow() {
        let authCoordinator = coordinatorFactory.makeAuthCoordinator(navigationController: rootNavigationController)
        addChild(authCoordinator)
        authCoordinator.start()
    }
    
    /// Запускает основной поток (например, TabBar) с указанным начальным экраном.
    ///
    /// - Parameter initialScreen: Начальный экран, который должен отобразиться.
    private func startMainFlow(initialScreen: DeepLink.MainFlowScreen) {
        let mainFlowCoordinator = coordinatorFactory.makeMainFlowCoordinator(navigationController: rootNavigationController, initialScreen: initialScreen)
        addChild(mainFlowCoordinator)
        mainFlowCoordinator.start()
    }
}
