//
//  String+Extension.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 2/8/22.
//

import Foundation

extension String {
    
    func toDecimal() -> Decimal? {
        return Decimal(string: self)
    }
}
