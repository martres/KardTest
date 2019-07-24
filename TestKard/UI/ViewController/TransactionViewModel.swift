//
//  TransactionViewModel.swift
//  TestKard
//
//  Created by Martreux Steven on 24/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Foundation

class TransactionViewModel {

    private let service: TransactionService
    private(set) var transactions: [Transaction] = []
    
    init(service: TransactionService = TransactionService()) {
        self.service = service
    }
    
    func getListOfTransaction(completion: @escaping (_ success: Bool) -> ()) {
        service.getTransactionList { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .failure(_): completion(false)
            case .success(let transactions):
                self.transactions = transactions
                completion(true)
            }
        }
    }
    
    
    
    
}
