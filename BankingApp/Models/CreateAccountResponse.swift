//
//  CreateAccountResponse.swift
//  BankingApp
//
//  Created by Pavan More on 10/01/25.
//

import Foundation

struct CreateAccountResponse: Decodable {
    let success: Bool
    let error: String?
}
