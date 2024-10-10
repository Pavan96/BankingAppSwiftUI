//
//  Account.swift
//  BankingApp
//
//  Created by Pavan More on 10/10/24.
//

import Foundation

enum AccounType: String, Codable, CaseIterable {
    case checking
    case saving
}

extension AccounType {
    var title: String {
        switch self {
        case .checking:
            return "Checking"
        case .saving:
            return "Saving"
        }
    }
}

struct Account: Codable {
    let id: UUID
    var name: String
    let accountType: AccounType
    var balance: Double
}



