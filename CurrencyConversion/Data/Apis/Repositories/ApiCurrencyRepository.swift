//
//  ApiCurrencyRepository.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 4/8/22.
//

import Foundation

class ApiCurrencyRepository: CurrencyRepository {
    
    func fetchCurrencys(completion: @escaping (APIResult) -> Void) {
        HttpUtility.shared.create(request: CurrencyRequest.currencyList, then: completion)
    }
}
