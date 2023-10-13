//
//  RateView.swift
//  Currency Converter
//
//  Created by Marius Malyshev on 08.06.2023.
//

import SwiftUI

struct RateView: View {
    @ObservedObject var rateViewModel: RateListViewModel
    @FocusState private var isFocused: Bool
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
            
            TextField("0.69", text: Binding(
                get: { rateViewModel.rates[index].amount ?? "" },
                set: { newValue in
                    rateViewModel.rates[index].amount = newValue
                    rateViewModel.updateAmounts(from: rateViewModel.rates[index])
                }
            ))
            .multilineTextAlignment(.trailing)
            .font(.title2)
            .bold()
            .focused($isFocused)
            .keyboardType(.decimalPad)
        }
        .onTapGesture {
            rateViewModel.clearList()
            rateViewModel.rates[index].amount = ""
            rateViewModel.updateAmounts(from: rateViewModel.rates[index])
            isFocused = true
        }
    }
}

#Preview {
    RateView(rateViewModel: RateListViewModel(), index: 0)
}
