//
//  AccountSummaryCell.swift
//  UiKitBankApp
//
//  Created by Albany Buipe on 27/05/2023.
//

import Foundation
import UIKit

class AccountSummaryCell: UITableViewCell {
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 100
    
    lazy var typeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Banking"
        lbl.adjustsFontForContentSizeCategory = true
        lbl.font = UIFont.preferredFont(forTextStyle: .caption1)
        contentView.addSubview(lbl)
        return lbl
    }()
    
    lazy var divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = appColor
        view.heightAnchor.constraint(equalToConstant: 4).isActive = true
        view.widthAnchor.constraint(equalToConstant: 60).isActive = true
        contentView.addSubview(view)
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Account Name"
        lbl.font = UIFont.preferredFont(forTextStyle: .body)
        contentView.addSubview(lbl)
        return lbl
    }()
    
    lazy var balanceLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Current Balance"
        lbl.font = UIFont.preferredFont(forTextStyle: .body)
        contentView.addSubview(lbl)
        return lbl
    }()
    
    lazy var amountLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "$179,562.58"
        lbl.textAlignment = .right
        lbl.font = UIFont.preferredFont(forTextStyle: .body)
        contentView.addSubview(lbl)
        return lbl
    }()
    
    lazy var balanceStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [balanceLabel, amountLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 0
        contentView.addSubview(view)
        return view
    }()
    
    lazy var chevronImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.right")!.withTintColor(appColor, renderingMode: .alwaysOriginal)
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryCell {
    private func setup() {
        
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            
            divider.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            divider.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),

            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 2),
            nameLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
//
            balanceStack.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 0),
            balanceStack.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStack.trailingAnchor, multiplier: 4),
            
            chevronImage.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 1),
//            chevronImage.leadingAnchor.constraint(equalToSystemSpacingAfter: balanceStack.trailingAnchor, multiplier: 0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImage.trailingAnchor, multiplier: 1),
        ])
    }
}
