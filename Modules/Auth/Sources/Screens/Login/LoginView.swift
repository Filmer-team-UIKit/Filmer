//
//  LoginView.swift
//  Auth
//
//  Created by Иван Карплюк on 20.02.2025.
//


import UIKit
import SharedResources

public protocol LoginView: AnyObject {
    /// Отображает сообщение об ошибке.
    func showError(_ message: String)
    /// Показывает индикатор загрузки.
    func showLoading()
    /// Скрывает индикатор загрузки.
    func hideLoading()
}

public class LoginViewController: UIViewController, LoginView {
    /// Презентер для экрана логина.
    public var presenter: LoginPresenterProtocol!
    
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton(type: .system)
    private let backButton = UIButton(type: .system)
    private let activityIndicator = UIActivityIndicatorView(style: .medium)

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        presenter.viewDidLoad()
    }
    
    /// Настраивает UI компоненты экрана логина.
    private func setupUI() {
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        loginButton.setTitle("Login", for: .normal)
        backButton.setTitle("Back to Registration", for: .normal)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, backButton, activityIndicator])
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 250),
            passwordTextField.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
    }
    
    @objc private func loginTapped() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        presenter.loginButtonTapped(email: email, password: password)
    }
    
    @objc private func backTapped() {
        presenter.backToRegistrationTapped()
    }
    
    public func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    public func showLoading() {
        activityIndicator.startAnimating()
    }
    
    public func hideLoading() {
        activityIndicator.stopAnimating()
    }
}
