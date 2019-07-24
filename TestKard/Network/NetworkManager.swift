//
//  NetworkManager.swift
//  TestKard
//
//  Created by Martreux Steven on 24/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Foundation

private let graphQLURL: String = "https://staging.kard.eu/graphql"
private let authBeared: String = "eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIwMjg1OTVjNy03OTcyLTQ3NGYtOWQ2NC0xZTgxYWUyZDQ4YmQiLCJzdWIiOiI1YTdjOTU5OC05MDQzLTRmMDQtOTExMC1iNjYzNWJmNDZkYzYiLCJzY3AiOiJ1c2VyIiwiYXVkIjpudWxsLCJpYXQiOjE1NjM4NjMzODYsImV4cCI6MTU2NDQ2ODE4Nn0.vi_kHglVWI0FpJwIY7MWklEyoUo62LftyJBsCd3wlQM"

class NetworkManager<T: Codable> {
    
    private let session: URLSession = .shared
    
    func fetchData(with body: Data,
                   completion: @escaping (Result<T, Error>) -> ()) {
        var urlRequest = URLRequest(url: URL(string: graphQLURL)!)
        urlRequest.addValue("Bearer " + authBeared, forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = body
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            
            guard let data = data else {
                completion(.failure(error!))
                return
            }
                        
            let decoder = JSONDecoder()
            
            do {
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch let error {
                completion(.failure(error))
            }
            }.resume()
    }
}
