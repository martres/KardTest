//
//  Transaction.swift
//  TestKard
//
//  Created by Martreux Steven on 24/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Foundation

struct Currency: Codable {
    let name: String
    let symbol: String
}

struct Amount: Codable {
    let currency: Currency
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case value = "value"
        case currency = "currency"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let value = try? container.decode(Float.self, forKey: .value) {
            self.value = String(value)
        } else {
            value = try container.decode(String.self, forKey: .value)
        }
        currency = try container.decode(Currency.self, forKey: .currency)
    }
    
    func encode(to encoder: Encoder) throws {
    }
}

struct Image: Codable {
    let contentType: String
    let height: Double
    let width: Double
    let url: String
}

struct Category: Codable {
    let image: Image
    let name: String
}

struct TransactionDetail: Codable {
    let amount: Amount
    let category: Category
    let description: String
    let title: String
    let user: User
}

struct Transaction: Codable {
    let cursor: String
    let node: TransactionDetail
    
    enum CodingKeys: String, CodingKey {
        case cursor = "cursor"
        case node = "node"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        cursor = try container.decode(String.self, forKey: .cursor)
        node = try container.decode(TransactionDetail.self, forKey: .node)
    }
    
    func encode(to encoder: Encoder) throws {
    }
}
