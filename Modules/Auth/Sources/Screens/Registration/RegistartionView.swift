//
//  RegistartionView.swift
//  Auth
//
//  Created by Иван Карплюк on 20.02.2025.
//

import UIKit

public protocol RegistrationView: AnyObject {
    /// Отображает сообщение об ошибке.
    func showError(_ message: String)
    /// Показывает индикатор загрузки.
    func showLoading()
    /// Скрывает индикатор загрузки.
    func hideLoading()
}

public class RegistrationViewController: UIViewController, RegistrationView {

    public var presenter: RegistrationPresenterProtocol!
    
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let registerButton = UIButton(type: .system)
    private let goToLoginButton = UIButton(type: .system)
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupUI()
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        registerButton.setTitle("Register", for: .normal)
        goToLoginButton.setTitle("Go to Login", for: .normal)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, registerButton, goToLoginButton, activityIndicator])
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
        
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        goToLoginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    @objc private func registerTapped() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        presenter.registerButtonTapped(email: email, password: password)
    }
    
    @objc private func loginTapped() {
        presenter.goToLoginTapped()
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
