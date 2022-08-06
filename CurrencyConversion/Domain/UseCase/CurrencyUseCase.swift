//
//  CurrencyUseCase.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 4/8/22.
//

import Foundation

class CurrencyUseCase {
    private let currencyRepository: CurrencyRepository
    
    init() {
        currencyRepository = ApiCurrencyRepository()
    }
    
    deinit { }
    
    func currencyList(completion: @escaping(_ result: [Currency]) -> Void) {
        
        if let currencyList = UserPreference().currencyList {
            completion(getData(data: currencyList))
        } else {
            currencyRepository.fetchCurrencys { [self] result in
                switch result {
                case .success(let data):
                    if let response = try? JSONDecoder().decode([String: String].self, from: data) {
                        UserPreference().currencyList = response
                        completion(getData(data: response))
                    }
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
            }
        }
    }
    
    private func getData(data: [String: String]) -> [Currency] {
        var currencyList = [Currency]()
        
        for (key, value) in data {
            currencyList.append(Currency(code: key, countryName: value))
        }
        
        return currencyList
    }
}
