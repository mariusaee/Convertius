//
//  Rate.swift
//  Currency Converter
//
//  Created by Marius Malyshev on 06.06.2023.
//

import Foundation

struct Rate: Identifiable {
    let id = UUID()
    let name: String
    let rateToUSD: Double
    var amount: Double = 0.0
}
