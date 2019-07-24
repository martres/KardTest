//
//  Apollo.swift
//  TestKard
//
//  Created by Martreux Steven on 23/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Apollo
import Foundation

final class Apollo {
    static let shared = Apollo()
    
    private(set) lazy var client: ApolloClient = {
        let config: URLSessionConfiguration = .default
        let token = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIwMjg1OTVjNy03OTcyLTQ3NGYtOWQ2NC0xZTgxYWUyZDQ4YmQiLCJzdWIiOiI1YTdjOTU5OC05MDQzLTRmMDQtOTExMC1iNjYzNWJmNDZkYzYiLCJzY3AiOiJ1c2VyIiwiYXVkIjpudWxsLCJpYXQiOjE1NjM4NjMzODYsImV4cCI6MTU2NDQ2ODE4Nn0.vi_kHglVWI0FpJwIY7MWklEyoUo62LftyJBsCd3wlQM"
        let url = URL(string: "https://staging.kard.eu/graphql")!
        config.httpAdditionalHeaders = ["Authorization": token]
        let networkTransport = HTTPNetworkTransport(url: url, configuration: config)
        return ApolloClient(networkTransport: networkTransport)
    }()
}
