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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableTransaction.dataSource = self
        tableTransaction.register(UINib(nibName: TransactionCell.typeName, bundle: nil), forCellReuseIdentifier: TransactionCell.typeName)
    }
}

extension TransactionViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TransactionCell.typeName, for: indexPath) as? TransactionCell else {
            return UITableViewCell()
        }
        //cell.setup(with: )
        return cell
    }
    
}
