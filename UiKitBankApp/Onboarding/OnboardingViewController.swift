//
//  OnboardingViewController.swift
//  UiKitBankApp
//
//  Created by Albany Buipe on 24/05/2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private lazy var heroImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: heroImageName)
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = titleText
        return label
    }()
    
    private lazy var stack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            heroImage,
            titleLabel
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 20
        return view
    }()
    
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
        
        layout()
    }
}

// MARK: - Style and Layout for ViewControler1
extension OnboardingViewController {
    
    func layout() {
        
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 2),
        ])

    }
}

// MARK: actions for ViewControler1
extension OnboardingViewController {
    
}
