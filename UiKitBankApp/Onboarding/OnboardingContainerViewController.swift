//
//  OnboardingContainerViewController.swift
//  UiKitBankApp
//
//  Created by Albany Buipe on 23/05/2023.
//

import UIKit

protocol OnboardingContainerViewControllerDelegate: AnyObject {
    func didFinishOnboarding()
}

class OnboardingContainerViewController: UIViewController {
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .borderless()
        button.setTitle("Close", for: [])
        button.addTarget(self, action: #selector(closeTapped), for: .primaryActionTriggered)
        return button
    }()
    
    let pageViewController: UIPageViewController
    var pages: [UIViewController] = []
    var currentVC: UIViewController
    
    weak var delegate: OnboardingContainerViewControllerDelegate?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let page1 = OnboardingViewController(heroImageName: "delorean", titleText: "Financio: Your all-in-one banking companion, empowering you to manage your finances effortlessly.")
        let page2 = OnboardingViewController(heroImageName: "thumbs", titleText: "Seamlessly track transactions, monitor account balances, and make secure payments with ease.")
        let page3 = OnboardingViewController(heroImageName: "world", titleText: "Experience banking reimagined with intuitive features, personalized insights, and utmost security for your financial peace of mind.")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
        
    }
    
}

extension OnboardingContainerViewController {
    
    private func setup() {
        view.backgroundColor = .systemPurple
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
        ])
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        currentVC = pages.first!
    }
    
    private func layout() {
        view.addSubview(closeButton)
        
        closeButton.pintoLeft(superview: view.leadingAnchor, space: 16)
        closeButton.pintoTop(superview: view.safeAreaLayoutGuide.topAnchor, space: 16)
    }
}

// MARK: - OnboardingContainerViewController actions
extension OnboardingContainerViewController {
    @objc func closeTapped(_ sender: UIButton) {
        print("Close tapped!")
        delegate?.didFinishOnboarding()
    }
}

// MARK: - UIPageViewControllerDataSource delegate
extension OnboardingContainerViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
    
    private func getPreviousViewController(from viewControler: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewControler), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }
    
    private func getNextViewController(from viewControler: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewControler), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }
    
}
