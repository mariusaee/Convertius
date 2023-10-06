//
//  Double+Extention.swift
//  Convertius
//
//  Created by Marius Malyshev on 06.10.2023.
//

import Foundation

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
