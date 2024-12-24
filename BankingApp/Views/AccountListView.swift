//
//  AccountListView.swift
//  BankingApp
//
//  Created by Pavan More on 10/10/24.
//

import SwiftUI

struct AccountListView: View {
    let accounts: [AccountViewModel]
    
    var body: some View {
        List(accounts, id: \.accountId) { account in
            AccountCell(account: account)
        }.listStyle(.plain)
    }
}

struct AccountListView_Previews: PreviewProvider {
    static var previews: some View {
        let account = Account(id: UUID().uuidString, name: "Blake", accountType: .saving, balance: 304)
        let accountVM = AccountViewModel(account: account)
        return AccountListView(accounts: [accountVM])
    }
}

struct AccountCell: View {
    let account: AccountViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(account.name)
                        .font(.headline)
                    Text(account.accountType.title)
                }
                Spacer()
                Text("\(account.balance.formatAsCurrency())")
                    .foregroundColor(.green)
            }
        }
    }
}
