//
//  RegistartionPresenter.swift
//  Auth
//
//  Created by Иван Карплюк on 20.02.2025.
//

import UIKit

public protocol RegistrationPresenterProtocol {
    /// Вызывается при загрузке экрана.
    func viewDidLoad()
    /// Обрабатывает нажатие кнопки регистрации с вводом email и пароля.
    /// - Parameters:
    ///   - email: Email, введённый пользователем.
    ///   - password: Пароль, введённый пользователем.
    func registerButtonTapped(email: String, password: String)
    /// Обрабатывает нажатие кнопки перехода к экрану логина.
    func goToLoginTapped()
}



public class RegistrationPresenter: RegistrationPresenterProtocol {
    private weak var view: RegistrationView?
    private let registrationUseCase: RegistrationUseCaseProtocol
    private let router: RegistrationRouterProtocol
    
    /// Инициализирует RegistrationPresenter.
    /// - Parameters:
    ///   - view: Объект, реализующий RegistrationView.
    ///   - registrationUseCase: Сценарий регистрации.
    ///   - router: Роутер для переключения экранов.
    public init(view: RegistrationView,
                registrationUseCase: RegistrationUseCaseProtocol,
                router: RegistrationRouterProtocol) {
        self.view = view
        self.registrationUseCase = registrationUseCase
        self.router = router
    }
    
    public func viewDidLoad() {
        // Начальная настройка экрана регистрации.
    }
    
    public func registerButtonTapped(email: String, password: String) {
        view?.showLoading()
        let user = User(email: email, password: password)
        registrationUseCase.register(user: user) { [weak self] result in
            guard let self = self else { return }
            self.view?.hideLoading()
            switch result {
            case .success:
                // После успешной регистрации переходим к подтверждению почты.
                self.router.navigateToEmailConfirmation()
            case .failure(let error):
                self.view?.showError(error.localizedDescription)
            }
        }
    }
    
    public func goToLoginTapped() {
        router.navigateToLogin()
    }
}
