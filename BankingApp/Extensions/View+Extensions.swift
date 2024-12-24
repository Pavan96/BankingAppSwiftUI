//
//  View+Extensions.swift
//  BankingApp
//
//  Created by Pavan on 09/10/24.
//
import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
