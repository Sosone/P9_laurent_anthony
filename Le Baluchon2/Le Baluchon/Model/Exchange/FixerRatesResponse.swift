//
//  Exchange.swift
//  Le Baluchon
//
//  Created by Anthony Laurent on 08/02/2022.
//

import Foundation

struct FixerRatesResponse: Codable {
    let base: String
    let date: String
    let rates: [String: Double]
}
