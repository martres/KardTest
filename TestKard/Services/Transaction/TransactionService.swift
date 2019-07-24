//
//  TransactionService.swift
//  TestKard
//
//  Created by Martreux Steven on 23/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Apollo
import Foundation

final class TransactionService {
    
    private let apollo: Apollo
    
    required init(apollo: Apollo = .shared) {
        self.apollo = apollo
    }
    
    func getTransactionList() {
//        self.apollo.client.fetch(query: Transactions()) { (result, error) in
//            
//        }
    }
    
}
