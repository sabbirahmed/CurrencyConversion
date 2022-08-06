//
//  ConversionViewModel.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 2/8/22.
//

import Foundation

struct ConversionDataModel {
    var inputAmount: String = String()
    var errorMessage: String = String()
    var navigate: Bool = false
    var isPresentingErrorAlert: Bool = false
    var conversionRates: [ConversionRate] = [ConversionRate]()
}

class ConversionViewModel : ObservableObject {
    @Published var data = ConversionDataModel()
    private let amountValidation = AmountInputValidation()
    private let conversionUserCase = ConversionUseCase()
    
    func validateInputs() -> Bool {
        let result = amountValidation.inputValue(value: data.inputAmount)
         
        if !result.success {
            data.errorMessage = result.errorMessage ?? "Error occured"
            data.isPresentingErrorAlert = true
            return false
        }
        return true
    }
    
    func convertAmount() {
        conversionUserCase.conversionRate(inputValue: data.inputAmount.toDecimal()!) { [self] result in
            if let conversionData = result {
                data.conversionRates = conversionData
            }
        }
    }
}
