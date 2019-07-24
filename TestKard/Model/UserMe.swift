//
//  UserMe.swift
//  TestKard
//
//  Created by Martreux Steven on 24/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Foundation

struct Avatar: Codable {
    let contentType: String
    let height: Double
    let width: Double
    let url: String
}

struct User: Codable {
    let avatar: Avatar
}

struct Me: Codable {
    let email: String
    let transactions: [Transaction]
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case me = "me"
        case email = "email"
        case transactions = "transactions"
        case edges = "edges"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        let me  = try data.nestedContainer(keyedBy: CodingKeys.self, forKey: .me)
        email = try me.decode(String.self, forKey: .email)
        let transactionsDictionnary = try me.nestedContainer(keyedBy: CodingKeys.self, forKey: .transactions)
        transactions = try transactionsDictionnary.decode([Transaction].self, forKey: .edges)
    }
    
    func encode(to encoder: Encoder) throws {
    }
}


