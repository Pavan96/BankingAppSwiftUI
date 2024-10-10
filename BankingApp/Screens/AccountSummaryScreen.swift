//
//  AccountSummaryScreen.swift
//  BankingApp
//
//  Created by Pavan More on 10/10/24.
//

import SwiftUI

struct AccountSummaryScreen: View {
    
    @ObservedObject private var accountSummaryVM = AccountSummaryViewModel()
    
    var body: some View {
       
        VStack {
            AccountListView(accounts: self.accountSummaryVM.accounts)
            Text("\(accountSummaryVM.total.formatAsCurrency())")
            
        }
        .onAppear{
            self.accountSummaryVM.getAllAcounts()
        }
           
    }
}

struct AccountSummaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountSummaryScreen()
    }
}
