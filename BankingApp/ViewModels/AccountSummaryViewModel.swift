//
//  AccountSummaryViewModel.swift
//  BankingApp
//
//  Created by Pavan More on 10/10/24.
//

import Foundation

class AccountSummaryViewModel: ObservableObject {
    
    @Published var accounts:[AccountViewModel] = [AccountViewModel]()
    
    var total: Double  {
        accounts.map { $0.balance }.reduce(0, +)
    }
    
    func getAllAcounts() {
        AccountService.shared.getAllAccounts { result in
            switch result {
            case .success(let account):
                if let accounts = account {
                    DispatchQueue.main.async {
                        self.accounts = accounts.map(AccountViewModel.init)
                    }
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
    
    var accountId: String {
        account.id
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
