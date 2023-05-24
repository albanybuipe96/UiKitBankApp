//
//  OnboardingViewController.swift
//  UiKitBankApp
//
//  Created by Albany Buipe on 24/05/2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let stack = UIStackView()
    let heroImage = UIImageView()
    let titleLabel = UILabel()
    
    let heroImageName: String
    let titleText: String
    
    init(heroImageName: String, titleText: String) {
        self.heroImageName = heroImageName
        self.titleText = titleText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        style()
        layout()
    }
}

// MARK: - Style and Layout for ViewControler1
extension OnboardingViewController {
    
    func style() {
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        
        heroImage.translatesAutoresizingMaskIntoConstraints = false
        heroImage.contentMode = .scaleAspectFit
        heroImage.image = UIImage(named: heroImageName)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.text = titleText
    }
    
    func layout() {
        stack.addArrangedSubview(heroImage)
        stack.addArrangedSubview(titleLabel)
        
        view.addSubview(stack)
        
        // stack constraints
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 1),
        ])

    }
}

// MARK: actions for ViewControler1
extension OnboardingViewController {
    
}
