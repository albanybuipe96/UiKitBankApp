//
//  ViewController.swift
//  UiKitBankApp
//
//  Created by Albany Buipe on 22/05/2023.
//

import UIKit

//protocol LogoutDelegate: AnyObject {
//    func didLogout()
//}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Financio Inc."
        label.font = UIFont(name: "Helvetica", size: 55)
        label.textColor = .systemGray2
        return label
    }()
    
    private lazy var mottoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Empowering Your Financial Journey!"
        label.font = UIFont(name: "Times New Roman", size: 14)
        return label
    }()

    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var signinButton: UIButton = {
        let signinButton = UIButton(type: .system)
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        signinButton.configuration = .filled()
        signinButton.configuration?.imagePadding = 8
        signinButton.setTitle("Sign in", for: [])
        signinButton.addTarget(self, action: #selector(signinTapped), for: .primaryActionTriggered)
        signinButton.layer.cornerRadius = 5
        signinButton.clipsToBounds = true
        
        return signinButton
    }()
    
    private lazy var errorMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        loginView.usernameTextField.text
    }
    
    var password: String? {
        loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signinButton.configuration?.showsActivityIndicator = false
    }
    
}

extension LoginViewController {
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(mottoLabel)
        view.addSubview(loginView)
        view.addSubview(signinButton)
        view.addSubview(errorMessageLabel)
        
        // Title
        NSLayoutConstraint.activate([
            mottoLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Subtitle
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: mottoLabel.bottomAnchor, multiplier: 3),
            mottoLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            mottoLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2),
            view.centerYAnchor.constraint(equalTo: loginView.centerYAnchor),
        ])
        
        // Button
        NSLayoutConstraint.activate([
            signinButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signinButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signinButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        // Error message
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signinButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
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
