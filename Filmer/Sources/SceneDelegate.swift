import UIKit
import Product
import Auth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        let rootNavigationController = UINavigationController()
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
        
        let authCoordinator = AuthCoordinator(navigationController: rootNavigationController)
        let moduleCoordinators: [ModuleCoordinator] = [authCoordinator]
        
        let appCoordinator = AppCoordinator(window: window,
                                            rootNavigationController: rootNavigationController,
                                            moduleCoordinators: moduleCoordinators)
        
        self.appCoordinator = appCoordinator
        appCoordinator.start()
    }
}
