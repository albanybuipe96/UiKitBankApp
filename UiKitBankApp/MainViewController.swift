//
//  MainViewController.swift
//  UiKitBankApp
//
//  Created by Albany Buipe on 26/05/2023.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        setupViews()
        setupTabBar()
    }
    
    private func setupViews() {
        let summaryVC: AccountSummaryViewController = {
            let vc = AccountSummaryViewController()
            vc.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
            
            return vc
        }()
        
        let moneyVC: MoveMoneyViewController = {
            let vc = MoveMoneyViewController()
            vc.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move Money")
            return vc
        }()
        
        let moreVC: MoreViewController = {
            let vc = MoreViewController()
            vc.setTabBarImage(imageName: "ellipsis.circle", title: "Move")
            return vc
        }()

        let summaryNC = {
            let nc = UINavigationController(rootViewController: summaryVC)
            nc.navigationBar.barTintColor = appColor
            return nc
        }()
        
        let moneyNC = {
            let nc = UINavigationController(rootViewController: moneyVC)
//            nc.navigationBar.barTintColor = appColor
            return nc
        }()
        
        let moreNC = {
            let nc = UINavigationController(rootViewController: moreVC)
//            nc.navigationBar.barTintColor = appColor
            return nc
        }()
        
        let tabBarList = [
            summaryNC,
            moneyNC,
            moreNC,
        ]
        
        viewControllers = tabBarList
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupTabBar() {
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
    }
}

class AccountSummaryViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemGreen
    }
}

class MoveMoneyViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
    }
}

class MoreViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
    }
}
