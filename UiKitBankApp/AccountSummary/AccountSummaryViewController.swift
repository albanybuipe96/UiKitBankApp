//
//  AccountSummaryViewController.swift
//  UiKitBankApp
//
//  Created by Albany Buipe on 26/05/2023.
//

import UIKit
import HubtelLayoutKit

class AccountSummarViewController: UIViewController {
    
    struct Profile {
        let firstName: String
        let lastName: String
    }
    
    var profile: Profile?
    
    var accounts: [AccountSummaryCell.ViewModel] = []
    
    var tableHeader = {
        let header = AccountSummaryHeaderView(frame: .zero)
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        return header
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.tableHeaderView = tableHeader
        table.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID)
        table.rowHeight = AccountSummaryCell.rowHeight
        table.tableFooterView = UIView()
        table.backgroundColor = appColor
        self.view.addSubview(table)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData()
    }
}

extension AccountSummarViewController {
    private func setup() {
        tableView.constrainToSuperView(on: view)
    }
}

extension AccountSummarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard !accounts.isEmpty else {
                return UITableViewCell()
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
            let account = accounts[indexPath.row]
            cell.configure(with: account)
            return cell
        }()
        
        return cell
    }
    
}

extension AccountSummarViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
    }
}

// MARK: - Networking
extension AccountSummarViewController {
    private func fetchData() {
        fetchAccounts()
        fetchProfiles()
    }
    
    private func fetchAccounts() {
        let savings = AccountSummaryCell.ViewModel(accountType: .Banking,
                                                            accountName: "Basic Savings",
                                                        balance: 929466.23)
        let chequing = AccountSummaryCell.ViewModel(accountType: .Banking,
                                                    accountName: "No-Fee All-In Chequing",
                                                    balance: 17562.44)
        let visa = AccountSummaryCell.ViewModel(accountType: .CreditCard,
                                                       accountName: "Visa Avion Card",
                                                       balance: 412.83)
        let masterCard = AccountSummaryCell.ViewModel(accountType: .CreditCard,
                                                       accountName: "Student Mastercard",
                                                       balance: 50.83)
        let investment1 = AccountSummaryCell.ViewModel(accountType: .Investment,
                                                       accountName: "Tax-Free Saver",
                                                       balance: 2000.00)
        let investment2 = AccountSummaryCell.ViewModel(accountType: .Investment,
                                                       accountName: "Growth Fund",
                                                       balance: 15000.00)
        accounts.append(savings)
        accounts.append(chequing)
        accounts.append(visa)
        accounts.append(masterCard)
        accounts.append(investment1)
        accounts.append(investment2)
    }
    
    private func fetchProfiles() {
        
    }
}
