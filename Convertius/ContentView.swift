//
//  ContentView.swift
//  Convertius
//
//  Created by Marius Malyshev on 05.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RateListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 15 Pro")
        ContentView()
            .previewDevice("iPhone 15 Pro")
            .preferredColorScheme(.dark)
        ContentView()
            .previewDevice("iPhone 15 Pro")
            .previewInterfaceOrientation(.landscapeLeft)
        ContentView()
            .previewDevice("iPad Pro (12.9-inch) (6th generation) (16GB)")
    }
}
