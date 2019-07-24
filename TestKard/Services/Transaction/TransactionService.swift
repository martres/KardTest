//
//  TransactionService.swift
//  TestKard
//
//  Created by Martreux Steven on 23/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Foundation

typealias TransactionWorker = NetworkManager<Me>

final class TransactionService {
    
    private let worker = TransactionWorker()
    
    func getTransactionList(completion: @escaping (Result<[Transaction], Error>) -> ()) {
        // Should be put in file
        guard let body = "query={ me { email transactions { edges { cursor node { id title description user { avatar { contentType url height width } } category { image { contentType url height width } name } amount { currency { name symbol } value } } } pageInfo { startCursor endCursor hasNextPage } } } }".data(using: .utf8) else {
            return
        }
        worker.fetchData(with: body) { (result) in
            switch result {
            case .failure(let error): completion(.failure(error))
            case .success(let me): completion(.success(me.transactions))
            }
        }
    }
}
