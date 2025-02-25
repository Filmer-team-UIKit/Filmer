//
//  BaseProductCoordinator.swift
//  Product
//
//  Created by Иван Карплюк on 25.02.2025.
//

import Platform
import UIKit

/// Прокси для базового координатора, который наследуется от Platform.BaseCoordinator
/// и добавляет логирование. Класс объявлен как open, чтобы его можно было наследовать в других модулях.
open class BaseCoordinatorProxy: BaseCoordinator {
    /// Помечаем метод start как open, чтобы разрешить его переопределение.
    open override func start() {
        print("[Coordinator] \(String(describing: type(of: self))) start() called")
        super.start()
    }
    
    /// Помечаем метод handle как open, чтобы разрешить его переопределение.
    open override func handle(deepLink: DeepLink?) -> Bool {
        print("[Coordinator] \(String(describing: type(of: self))) handle(deepLink:) called with \(String(describing: deepLink))")
        return super.handle(deepLink: deepLink)
    }
    
    open override func addChild(_ coordinator: Coordinator) {
        print("[Coordinator] \(String(describing: type(of: self))) addChild() called with \(coordinator)")
        super.addChild(coordinator)
    }
    
    open override func removeChild(_ coordinator: Coordinator) {
        print("[Coordinator] \(String(describing: type(of: self))) removeChild() called with \(coordinator)")
        super.removeChild(coordinator)
    }
}
