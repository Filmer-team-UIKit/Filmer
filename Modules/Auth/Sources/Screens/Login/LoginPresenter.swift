//
//  LoginPresenter.swift
//  Auth
//
//  Created by Иван Карплюк on 20.02.2025.
//

import UIKit

public protocol LoginPresenterProtocol {
    func viewDidLoad()
    func loginButtonTapped(email: String, password: String)
    func backToRegistrationTapped()
}


/// Конкретная реализация презентера для экрана логина.
public class LoginPresenter: LoginPresenterProtocol {
    private weak var view: LoginView?
    private let loginUseCase: LoginUseCaseProtocol
    private let router: LoginRouterProtocol
    
    /// Инициализирует LoginPresenter.
    /// - Parameters:
    ///   - view: Объект, реализующий LoginView.
    ///   - loginUseCase: Сценарий входа.
    ///   - router: Роутер для переключения экранов.
    public init(view: LoginView,
                loginUseCase: LoginUseCaseProtocol,
                router: LoginRouterProtocol) {
        self.view = view
        self.loginUseCase = loginUseCase
        self.router = router
    }
    
    public func viewDidLoad() {
        // Начальная настройка экрана логина.
    }
    
    public func loginButtonTapped(email: String, password: String) {
        view?.showLoading()
        let user = User(email: email, password: password)
        loginUseCase.login(user: user) { [weak self] result in
            guard let self = self else { return }
            self.view?.hideLoading()
            switch result {
            case .success:
                self.router.navigateToMainFlow()
            case .failure(let error):
                self.view?.showError(error.localizedDescription)
            }
        }
    }
    
    public func backToRegistrationTapped() {
        router.navigateBackToRegistration()
    }
}
