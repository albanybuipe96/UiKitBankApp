//
//  AccountSummaryCell.swift
//  UiKitBankApp
//
//  Created by Albany Buipe on 27/05/2023.
//

import Foundation
import UIKit

class AccountSummaryCell: UITableViewCell {
    
    enum AccountType: String {
        case Banking
        case CreditCard
        case Investment
    }
    
    struct ViewModel {
        let accountType: AccountType
        let accountName: String
        let balance: Decimal
        
        var balanceStr: NSAttributedString {
            return CurrencyFormatter().makeAttributedCurrency(balance)
        }
    }
    
    let viewModel: ViewModel? = nil
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 112
    
    lazy var typeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Banking"
        lbl.adjustsFontForContentSizeCategory = true
        lbl.font = UIFont.preferredFont(forTextStyle: .caption1)
        lbl.adjustsFontSizeToFitWidth = true
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
        lbl.adjustsFontSizeToFitWidth = true
        contentView.addSubview(lbl)
        return lbl
    }()
    
    lazy var balanceLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Current Balance"
        lbl.font = UIFont.preferredFont(forTextStyle: .body)
        lbl.adjustsFontSizeToFitWidth = true
        contentView.addSubview(lbl)
        return lbl
    }()
    
    lazy var amountLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.attributedText = formattedBalance(dollars: "179,562", cents: "58")
        lbl.textAlignment = .right
        lbl.font = UIFont.preferredFont(forTextStyle: .body)
        lbl.adjustsFontSizeToFitWidth = true
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
    
    private func formattedBalance(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarSignAttr: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 4]
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttr)
        
        let dollarAttr: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let dollar = NSAttributedString(string: dollars, attributes: dollarAttr)
        
        let centAttr: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 4]
        let cent = NSAttributedString(string: cents, attributes: centAttr)
        rootString.append(dollar)
        rootString.append(cent)
        return rootString
    }
}

extension AccountSummaryCell {
    func configure(with vm: ViewModel) {
        typeLabel.text = vm.accountType.rawValue
        nameLabel.text = vm.accountName
        amountLabel.attributedText = vm.balanceStr
        
        switch vm.accountType {
        case .Banking:
            divider.backgroundColor = appColor
            balanceLabel.text = "Current Balance"
        case .CreditCard:
            divider.backgroundColor = .systemOrange
            balanceLabel.text = "Balance"
        case .Investment:
            divider.backgroundColor = .systemPurple
            balanceLabel.text = "Value"
        }
    }
}
