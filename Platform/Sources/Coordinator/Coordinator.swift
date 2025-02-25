//
//  BasicCoordinatorProtocol.swift
//  Platform
//
//  Created by Иван Карплюк on 19.02.2025.
//

import UIKit

/// Протокол, описывающий базового координатора, управляющего навигационным потоком.
///
/// Координатор отвечает за запуск своего flow'а, управление дочерними координаторами,
/// а также обработку входящих deep link'ов.
public protocol Coordinator: AnyObject {
    /// Массив дочерних координаторов для управления вложенными навигационными потоками.
    var childCoordinators: [Coordinator] { get set }
    
    /// Запускает навигационный поток координатора.
    func start()
    
    /// Обрабатывает входящий deep link.
    ///
    /// - Parameter deepLink: Опциональный deep link.
    /// - Returns: `true`, если deep link был обработан, иначе `false`.
    func handle(deepLink: DeepLink?) -> Bool
}

/// Базовая реализация координатора, предоставляющая функционал для управления дочерними координаторами
/// и делегирования обработки deep link'ов.
open class BaseCoordinator: Coordinator {
    public var childCoordinators: [Coordinator] = []
    
    /// Инициализатор базового координатора.
    public init() { }
    
    /// Запуск навигационного потока.
    ///
    /// **Важно:** Этот метод должен быть переопределён в подклассах.
    open func start() {
        fatalError("Метод start() должен быть реализован в подклассе")
    }
    
    /// Обрабатывает входящий deep link, делегируя его дочерним координаторам.
    ///
    /// - Parameter deepLink: Опциональный deep link.
    /// - Returns: `true`, если один из дочерних координаторов обработал deep link, иначе `false`.
    open func handle(deepLink: DeepLink?) -> Bool {
        for coordinator in childCoordinators where coordinator.handle(deepLink: deepLink) {
            return true
        }
        return false
    }
    
    /// Добавляет дочерний координатор.
    ///
    /// - Parameter coordinator: Координатор для добавления.
    open func addChild(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    /// Удаляет дочерний координатор.
    ///
    /// - Parameter coordinator: Координатор для удаления.
    open func removeChild(_ coordinator: Coordinator) {
        childCoordinators.removeAll { $0 === coordinator }
    }
}
