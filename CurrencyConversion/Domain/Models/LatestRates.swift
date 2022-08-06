//
//  ConversionRate.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 2/8/22.
//

import Foundation

struct LatestRates: Codable {
    let disclaimer: String
    let license: String
    let timestamp: Double
    let base: String
    let rates: [String: Decimal]
}
