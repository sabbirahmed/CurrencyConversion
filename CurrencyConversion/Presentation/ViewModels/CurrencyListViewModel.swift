//
//  CurrencyListViewModel.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 3/8/22.
//

import Foundation

struct CurrencyListDataModel {
    var currencyList: [Currency] = [Currency]()
    var navigate: Bool = false
}

class CurrencyListViewModel : ObservableObject{
    @Published var data = CurrencyListDataModel()
    private let currencyUserCase = CurrencyUseCase()
    
    func currencyList() {
        currencyUserCase.currencyList { [self] result in
            data.currencyList = result
        }
    }
    
    func itemClickEvent(item: Currency) {
        UserPreference().selectedCurrencyCode = item.code
        data.navigate = true
    }
}
