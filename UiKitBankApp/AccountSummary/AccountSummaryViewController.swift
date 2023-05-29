//
//  AccountSummaryViewController.swift
//  UiKitBankApp
//
//  Created by Albany Buipe on 26/05/2023.
//

import UIKit
import HubtelLayoutKit

class AccountSummarViewController: UIViewController {
    
    let games = ["Paceman", "Space Invaders", "Space Patrol"]
    
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
        self.view.addSubview(table)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension AccountSummarViewController {
    private func setup() {
        tableView.constrainToSuperView(on: view)
    }
}

extension AccountSummarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
            return cell
        }()
        
        return cell
    }
    
}

extension AccountSummarViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
    }
}
