//
//  RateListViewModel.swift
//  Currency Converter
//
//  Created by Marius Malyshev on 08.06.2023.
//

import Foundation

protocol RateListViewModelProtocol {
    func updateAmounts(from currency: Rate)
}

final class RateListViewModel: RateListViewModelProtocol, ObservableObject {
    
    @Published var rates: [Rate] = [
        Rate(name: "USD", rateToUSD: 1, amount: "0"),
        Rate(name: "RUB", rateToUSD: 100, amount: "0"),
        Rate(name: "EUR", rateToUSD: 0.93, amount: "0")
    ]
    
    func updateAmounts(from currency: Rate) {
        guard let baseAmount = Double(currency.amount) else { return }
        for index in 0..<rates.count {
            if rates[index].id != currency.id {
                let newAmount = (baseAmount / currency.rateToUSD) * rates[index].rateToUSD
                rates[index].amount = String(format: "%.2f", newAmount)
            }
        }
    }
}
