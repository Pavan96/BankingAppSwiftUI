//
//  AccountService.swift
//  BankingApp
//
//  Created by Pavan More on 10/10/24.
//

import Foundation

class AccountService {
    
    private init() { }
    
    static let shared = AccountService()
    
    func createAccount(createAccountRequest: CreateAccountRequest, completion: @escaping (Result<CreateAccountResponse, NetworkError>) -> Void) {
        
        guard let url = URL.urlForCreateAccounts() else {
            return completion(.failure(.badUrl))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(createAccountRequest)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let creatAccountResponse = try? JSONDecoder().decode(CreateAccountResponse.self, from: data)
            
            if let creatAccountResponse = creatAccountResponse {
                completion(.success(creatAccountResponse))
            } else {
                completion(.failure(.decodingError))
            }
            
        }
    }
    
    func getAllAccounts(completion: @escaping (Result<[Account]?, NetworkError>) -> Void) {
        guard let url = URL.urlForAccounts() else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return completion(.failure(.noData))
            }
            
            do {
                let accounts = try JSONDecoder().decode([Account].self, from: data)
                if accounts == nil {
                    completion(.failure(.decodingError))
                } else {
                    completion(.success(accounts))
                }
            } catch (let error) {
                print(error.localizedDescription.debugDescription)
                print(error.localizedDescription.description)
            }
            
        }.resume()
    }
}

enum NetworkError: Error {
    case badUrl
    case decodingError
    case noData
}
