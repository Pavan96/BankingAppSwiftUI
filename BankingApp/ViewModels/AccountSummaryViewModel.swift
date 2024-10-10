//
//  AccountSummaryViewModel.swift
//  BankingApp
//
//  Created by Pavan More on 10/10/24.
//

import Foundation

class AccountSummaryViewModel: ObservableObject {
    
    var account:[AccountViewModel] = [AccountViewModel]()
    
    var total: Double  {
        account.map { $0.balance }.reduce(0, +)
    }
    
    func getAllAcounts() {
        
        AccountService.shared.getAllAccounts { result in
            
            switch result {
            case .success(let account):
                if let accounts = account {
                    self.account = accounts.map(AccountViewModel.init)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
    
            }
        }
    }
}

class AccountViewModel {
    
    let account: Account
    
    init(account: Account) {
        self.account = account
    }
    
    var id: String {
        account.id.uuidString
    }
    
    var name: String {
        account.name
    }
    
    var balance: Double {
        account.balance
    }
    
    var accountType: AccounType {
        account.accountType
    }
}
