//
//  TransactionHeader.swift
//  TestKard
//
//  Created by Martreux Steven on 24/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import UIKit

protocol TransactionHeaderDelegate: class {
    func showFriends()
    func showMe()
}

class TransactionHeader: XibView {
    
    weak var delegate: TransactionHeaderDelegate?
    
    @IBOutlet private var buttons: [UIButton]!
    
    @IBAction private func showFriends() {
        buttons[0].setTitleColor(.purple, for: .normal)
        buttons[1].setTitleColor(.lightGray, for: .normal)
        delegate?.showFriends()
    }
    
    @IBAction private func showMe() {
        buttons[0].setTitleColor(.lightGray, for: .normal)
        buttons[1].setTitleColor(.purple, for: .normal)
        delegate?.showMe()
    }

    
}
