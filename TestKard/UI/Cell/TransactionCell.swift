//
//  TransactionCell.swift
//  TestKard
//
//  Created by Martreux Steven on 23/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import UIKit

struct TransactionCellModel {
    let imageUrl: String
    let name: String
    let type: String
    let price: String
}

class TransactionCell: UITableViewCell {
    
    @IBOutlet private weak var imageTransactionView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    func setup(with model: TransactionCellModel) {
        
    }
    
    
}
