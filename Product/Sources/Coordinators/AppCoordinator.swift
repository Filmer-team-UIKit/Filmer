//
//  AppCoordinator.swift
//  Product
//
//  Created by Иван Карплюк on 20.02.2025.
//

import UIKit
import Platform

/// Главный координатор приложения, который управляет окном и переключает модульные координаторы.
/// Он находится в Product и импортируется в главное приложение.
public class AppCoordinator: BaseCoordinator {
    public let window: UIWindow
    private let rootNavigationController: UINavigationController
    /// Массив модульных координаторов (например, Auth, Onboarding, MainFlow).
    public let moduleCoordinators: [ModuleCoordinator]
    
    /// Инициализирует AppCoordinator.
    /// - Parameters:
    ///   - window: Главное окно приложения.
    ///   - rootNavigationController: Навигационный контроллер, созданный в SceneDelegate.
    ///   - moduleCoordinators: Массив модульных координаторов, собранных на уровне основного таргета.
    public init(window: UIWindow,
                rootNavigationController: UINavigationController,
                moduleCoordinators: [ModuleCoordinator]) {
        self.window = window
        self.rootNavigationController = rootNavigationController
        self.moduleCoordinators = moduleCoordinators
        super.init()
    }
    
    /// Запускает приложение: устанавливает корневой контроллер окна и запускает стартовый модуль.
    public override func start() {
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
        
        // Пример: запускаем модуль "auth"
        startAuthFlow()
    }
    
    /// Обрабатывает входящие deep link'и на уровне приложения.
    /// - Parameter deepLink: Входящий deep link.
    /// - Returns: `true`, если deep link был обработан.
    public override func handle(deepLink: DeepLink?) -> Bool {
        guard let deepLink = deepLink else { return false }
        
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
    
    /// Запускает модуль Onboarding, выбирая координатор по moduleIdentifier.
    private func startOnboardingFlow() {
        if let onboardingCoordinator = moduleCoordinators.first(where: { $0.moduleIdentifier == "onboarding" }) {
            addChild(onboardingCoordinator)
            onboardingCoordinator.start()
        }
    }
    
    /// Запускает модуль Auth.
    private func startAuthFlow() {
        if let authCoordinator = moduleCoordinators.first(where: { $0.moduleIdentifier == "auth" }) {
            addChild(authCoordinator)
            authCoordinator.start()
        }
    }
    
    /// Запускает основной поток, выбирая координатор по moduleIdentifier.
    /// - Parameter initialScreen: Начальный экран в TabBar.
    private func startMainFlow(initialScreen: DeepLink.MainFlowScreen) {
        if let mainFlowCoordinator = moduleCoordinators.first(where: { $0.moduleIdentifier == "mainFlow" }) {
            addChild(mainFlowCoordinator)
            mainFlowCoordinator.start()
        }
    }
}
