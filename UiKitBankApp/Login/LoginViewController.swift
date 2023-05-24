//
//  ViewController.swift
//  UiKitBankApp
//
//  Created by Albany Buipe on 22/05/2023.
//

import UIKit

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let mottoLabel = UILabel()
//    let stackView = UIStackView()
    let loginView = LoginView()
    let signinButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        loginView.usernameTextField.text
    }
    
    var password: String? {
        loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signinButton.configuration?.showsActivityIndicator = false
    }
    
}

extension LoginViewController {
    private func style() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.text = "Financio Inc."
        titleLabel.font = UIFont(name: "Helvetica", size: 55)
        titleLabel.textColor = .systemGray2
        
        mottoLabel.translatesAutoresizingMaskIntoConstraints = false
        mottoLabel.textAlignment = .center
        mottoLabel.text = "Empowering Your Financial Journey!"
        mottoLabel.font = UIFont(name: "Times New Roman", size: 14)
//        mottoLabel.font = UIFont.italicSystemFont(ofSize: 14)
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.spacing = 8
        
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        signinButton.configuration = .filled()
        signinButton.configuration?.imagePadding = 8
        signinButton.setTitle("Sign in", for: [])
        signinButton.addTarget(self, action: #selector(signinTapped), for: .primaryActionTriggered)
        signinButton.layer.cornerRadius = 5
        signinButton.clipsToBounds = true
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(mottoLabel)
        view.addSubview(loginView)
        view.addSubview(signinButton)
        view.addSubview(errorMessageLabel)
        
        // titleLabel constraints
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: mottoLabel.topAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        // mottoLabel constraints
        NSLayoutConstraint.activate([
            mottoLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -50),
            mottoLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            mottoLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        // loginView constraints
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            loginView.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // signinButton constraints
        NSLayoutConstraint.activate([
            signinButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signinButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signinButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        // errorMessageLabel constraints
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signinButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
    }
}

extension LoginViewController {
    @objc func signinTapped(_ action: UIAction?) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username/password can't be nil!")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username/password can't be empty.")
            return
        }
        
        if username == "Albany" && password == "welcome" {
            signinButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "Incorrect username/password.")
        }
    }
    
    fileprivate func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
