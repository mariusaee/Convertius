//
//  RateView.swift
//  Currency Converter
//
//  Created by Marius Malyshev on 08.06.2023.
//

import SwiftUI

struct RateView: View {
    @ObservedObject var rateViewModel: RateListViewModel
    var index: Int
    
    var body: some View {
        HStack() {
            Image(systemName: "flag")
                .resizable()
                .frame(width: 32, height: 32)
            VStack(alignment: .leading) {
                Text(rateViewModel.rates[index].name)
                    .font(.title2)
                Text("$\(String(rateViewModel.rates[index].rateToUSD))")
                    .font(.caption)
            }
            
            Spacer()
            
            TextField("0.0", text: Binding(
                get: { String(rateViewModel.rates[index].amount) },
                set: { newValue in
                    rateViewModel.rates[index].amount = Double(newValue) ?? 0
                    rateViewModel.updateAmounts(from: rateViewModel.rates[index])
                }
            ))
            .font(.title2)
            .bold()
            .keyboardType(.decimalPad)
            .fixedSize()
        }
    }
}

#Preview {
    RateView(rateViewModel: RateListViewModel(), index: 0)
}
