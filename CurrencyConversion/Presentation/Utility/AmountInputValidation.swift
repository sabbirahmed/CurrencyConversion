//
//  AmountInputValidation.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 2/8/22.
//

import Foundation

struct ValidationResult {
    var success: Bool = false
    var errorMessage: String?
}

struct AmountInputValidation {
    
    func inputValue(value: String) -> ValidationResult {
        if value.isEmpty {
            return ValidationResult(success: false, errorMessage: "Amount is Empty")
        } else if value.toDecimal() == nil {
            return ValidationResult(success: false, errorMessage: "Input amount not valid data")
        } else {
            return ValidationResult(success: true, errorMessage: nil)
        }
    }
}
