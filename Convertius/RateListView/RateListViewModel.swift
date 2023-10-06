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
        Rate(name: "USD", rateToUSD: 1, amount: 0),
        Rate(name: "RUB", rateToUSD: 100, amount: 0),
        Rate(name: "EUR", rateToUSD: 0.93, amount: 0)
    ]
    
    func updateAmounts(from currency: Rate) {
        for index in 0..<rates.count {
            if rates[index].id != currency.id {
                let newAmount = (currency.amount / currency.rateToUSD) * rates[index].rateToUSD
                rates[index].amount = newAmount.rounded(toPlaces: 2)
            }
        }
    }
}
