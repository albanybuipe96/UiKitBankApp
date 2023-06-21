//
//  AcountSummaryHeaderView.swift
//  UiKitBankApp
//
//  Created by Albany Buipe on 26/05/2023.
//

import UIKit
//import Positioner

class AccountSummaryHeaderView: UIView {

    @IBOutlet var contentView: UIView!
    
//    lazy var containerStack: UIStackView = {
//        let view = UIStackView(arrangedSubviews: [leftStack, rightStack])
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.axis = .horizontal
//        view.spacing = 10
////        view.backgroundColor = .orange
//        return view
//    }()
    
//    lazy var image: UIImageView = {
//        let view = UIImageView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.image = UIImage(systemName: "sun.max.fill")
//        view.tintColor = .systemYellow
//        view.contentMode = .scaleAspectFit
//        return view
//    }()
    
//    lazy var rightStack: UIStackView = {
//        let view = UIStackView(arrangedSubviews: [image])
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.axis = .vertical
//        view.spacing = 10
////        view.backgroundColor = .orange
//        return view
//    }()
//
//    lazy var leftStack: UIStackView = {
//        let view = UIStackView(arrangedSubviews: [titleLabel, greetingLabel, nameLabel])
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.axis = .vertical
//        view.spacing = 10
////        view.backgroundColor = .orange
//        return view
//    }()
//
//    lazy var titleLabel: UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Financio Inc."
//        lbl.font = UIFont.preferredFont(forTextStyle: .title1)
//        return lbl
//    }()
//
//    lazy var greetingLabel: UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Good morning"
//        lbl.font = UIFont.preferredFont(forTextStyle: .body)
//        return lbl
//    }()
//
//    lazy var nameLabel: UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Albany"
//        lbl.font = UIFont.preferredFont(forTextStyle: .body)
//        return lbl
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 144)
    }

    private func commonInit() {
        let bundle = Bundle(for: AccountSummaryHeaderView.self)
        bundle.loadNibNamed("AccountSummaryHeaderView", owner: self, options: nil)
        contentView.backgroundColor = appColor
//        contentView.addSubview(containerStack)
        addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
//        NSLayoutConstraint.activate([
//            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
//            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
//            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 2),
////            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//        ])
        
//        containerStack.pintoTop(superview: contentView, space: 8)
//        containerStack.pintoBottom(superview: contentView, space: -8)
//        containerStack.pintoLeftAndRight(lsuperview: contentView.leadingAnchor, rsuperview: contentView.trailingAnchor, lspace: 8, rspace: -8)

    }
}
