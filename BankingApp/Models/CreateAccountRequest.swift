//
//  CreateAccountRequest.swift
//  BankingApp
//
//  Created by Pavan More on 10/01/25.
//

import Foundation

struct CreateAccountRequest: Codable {
    
    let name: String
    let accounType: String
    let balance: Double
}
