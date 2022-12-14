//
//  AcoountSummaryViewController.swift
//  Bankey
//
//  Created by User 2 on 08/10/22.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    
    
//    let games = [
//        "Pacman",
//        "Space Invaders",
//        "Space Patrol",
//    ]
    
    var accounts: [AccountSummaryCell.ViewModel] = []
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableHeaderView()
        fetchData()
    }
    private func setupTableHeaderView() {
        let header = AccountSummaryHeaderView(frame: .zero)
        
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        
        tableView.tableHeaderView = header
    }
}

extension AccountSummaryViewController {
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = appColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: "AccountSummaryCell")
        tableView.rowHeight = AccountSummaryCell.rowHeight
        tableView.tableFooterView = UIView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !accounts.isEmpty else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountSummaryCell", for: indexPath) as! AccountSummaryCell
        let account = accounts[indexPath.row]
        cell.configure(with: account)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension AccountSummaryViewController{
    
    private func fetchData(){
        let savings = AccountSummaryCell.ViewModel(accountType: .Banking,
                                                   accuntName: "Basic Savings",
                                                        balance: 929466.23)
        let chequing = AccountSummaryCell.ViewModel(accountType: .Banking,
                                                    accuntName: "No-Fee All-In Chequing",
                                                    balance: 17562.44)
        let visa = AccountSummaryCell.ViewModel(accountType: .CreditCard,
                                                accuntName: "Visa Avion Card",
                                                       balance: 412.83)
        let masterCard = AccountSummaryCell.ViewModel(accountType: .CreditCard,
                                                      accuntName: "Student Mastercard",
                                                       balance: 50.83)
        let investment1 = AccountSummaryCell.ViewModel(accountType: .Investment,
                                                       accuntName: "Tax-Free Saver",
                                                       balance: 2000.00)
        let investment2 = AccountSummaryCell.ViewModel(accountType: .Investment,
                                                       accuntName: "Growth Fund",
                                                       balance: 15000.00)
        
        accounts.append(savings)
        accounts.append(chequing)
        accounts.append(visa)
        accounts.append(masterCard)
        accounts.append(investment1)
        accounts.append(investment2)
        
    }
}
