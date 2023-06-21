//
//  AppDelegate.swift
//  UiKitBankApp
//
//  Created by Albany Buipe on 22/05/2023.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboardinViewContainerViewController = OnboardingContainerViewController()
    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        onboardinViewContainerViewController.delegate = self
        
        registerForNotifications()
        
        displayLogin()
        
        return true
    }

}

// MARK: - Actions & Events Section
extension AppDelegate {
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: .logout, object: nil)
    }
    
    private func displayLogin() {
        setRootViewController(loginViewController)
    }
    
    private func displayNextScreen() {
        if LocalState.hasOnboarded {
            prepareMainView()
            setRootViewController(mainViewController)
        } else {
            setRootViewController(onboardinViewContainerViewController)
        }
    }
    
    private func prepareMainView() {
        mainViewController.setStatusBar()
//        UINavigationBar.appearance().isTranslucent = false
    }
    
    @objc func didLogout() {
        setRootViewController(loginViewController, animated: true)
    }
}

// MARK: - LoginViewControllerDelegate Section
extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        displayNextScreen()
    }
}

// MARK: - OnboardingContainerViewControllerDelegate Section
extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        print("didFinishOnboarding - Onboarded successfully.")
        LocalState.hasOnboarded  = true
        prepareMainView()
        setRootViewController(mainViewController)
    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}
