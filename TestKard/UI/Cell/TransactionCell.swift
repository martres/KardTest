//
//  TransactionCell.swift
//  TestKard
//
//  Created by Martreux Steven on 23/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Kingfisher
import UIKit

struct TransactionCellModel {
    let imageUrl: String
    let name: String
    let type: String
    let price: String
    let currency: String
}

class TransactionCell: UITableViewCell {
    
    @IBOutlet private weak var imageTransactionView: UIImageView!
    @IBOutlet private weak var viewPrice: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewPrice.layer.cornerRadius = 20
        viewPrice.clipsToBounds = true
        imageTransactionView.layer.cornerRadius = imageTransactionView.frame.width / 2
        imageTransactionView.clipsToBounds = true
    }
    
    func setup(with model: TransactionCellModel) {
        nameLabel.text = model.name
        typeLabel.text = model.type
        priceLabel.text = "\(model.price) \(model.currency)"
        if let url = URL(string: model.imageUrl) {
            imageTransactionView.kf.setImage(with: url)
        }
    }
    
    
}
