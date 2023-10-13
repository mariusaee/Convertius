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
        Rate(name: "USD", rateToUSD: 1, amount: nil),
        Rate(name: "RUB", rateToUSD: 100, amount: nil),
        Rate(name: "EUR", rateToUSD: 0.93, amount: nil)
    ]
    
    func clearList() {
        for rateIndex in 0..<rates.count {
            rates[rateIndex].amount = nil
        }
    }
    
    func updateAmounts(from currency: Rate) {
        for rateIndex in 0..<rates.count {
            if rates[rateIndex].id != currency.id {
                guard let amount = currency.amount,
                      let doubleAmount = Double(amount)
                else {
                    rates[rateIndex].amount = nil
                    return
                }
                        
                let newAmount = (doubleAmount / currency.rateToUSD) * rates[rateIndex].rateToUSD
                rates[rateIndex].amount = String(newAmount.rounded(toPlaces: 2))
            }
        }
    }
}
