//
//  TransactionViewController.swift
//  TestKard
//
//  Created by Martreux Steven on 23/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController {
    
    @IBOutlet private weak var tableTransaction: UITableView!
    fileprivate var viewModel: TransactionViewModel = TransactionViewModel()
    fileprivate lazy var headerView: TransactionHeader = {
        let view = TransactionHeader()
        view.delegate = self
        return view
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        //setupHeaderTableView()
        getTransactions()
    }
    
    private func setupHeaderTableView() {
        let headerView = TransactionHeader()
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        headerView.delegate = self
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(headerView)
        
        tableTransaction.tableHeaderView = containerView
        
//        containerView.centerXAnchor.constraint(equalTo: tableTransaction.centerXAnchor).isActive = true
//        containerView.widthAnchor.constraint(equalTo: tableTransaction.widthAnchor).isActive = true
//        containerView.topAnchor.constraint(equalTo: tableTransaction.topAnchor).isActive = true
        
        tableTransaction.tableHeaderView?.layoutIfNeeded()
        tableTransaction.tableHeaderView = tableTransaction.tableHeaderView
    }
    
    private func setupTableView() {
        tableTransaction.estimatedRowHeight = 80
        tableTransaction.rowHeight = UITableView.automaticDimension
        tableTransaction.dataSource = self
        tableTransaction.delegate = self
        tableTransaction.register(UINib(nibName: TransactionCell.typeName, bundle: nil), forCellReuseIdentifier: TransactionCell.typeName)
        tableTransaction.addSubview(self.refreshControl)
    }
    
    private func getTransactions() {
        viewModel.getListOfTransaction(completion: { [weak self] (success) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if success {
                    self.tableTransaction.reloadData()
                } else {
                    let alert = UIAlertController(title: "No internet", message: "Please refresh when internet is okay", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                self.refreshControl.endRefreshing()
            }
        })
    }
    
    @objc
    func handleRefresh() {
        getTransactions()
    }
}

extension TransactionViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TransactionCell.typeName, for: indexPath) as? TransactionCell else {
            return UITableViewCell()
        }
        let transaction = viewModel.transactions[indexPath.row]
        let transactionCellModel =
            TransactionCellModel(imageUrl: transaction.node.category.image.url,
                                 name: transaction.node.title,
                                 type: transaction.node.category.name,
                                 price: transaction.node.amount.value,
                                 currency: transaction.node.amount.currency.symbol)
        cell.setup(with: transactionCellModel)
        return cell
    }
}

extension TransactionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

extension TransactionViewController: TransactionHeaderDelegate {
    
    func showFriends() {
        viewModel.shuffleTransactions()
        tableTransaction.reloadData()
    }
    
    func showMe() {
        viewModel.shuffleTransactions()
        tableTransaction.reloadData()
    }
    
}
