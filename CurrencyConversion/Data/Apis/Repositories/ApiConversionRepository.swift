//
//  ApiConversionRepository.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 4/8/22.
//

import Foundation

class ApiConversionRepository: ConversionRepository {
    
    func fetchConversionRate(completion: @escaping (APIResult) -> Void) {
        HttpUtility.shared.create(request: ConversionRequest.getLatestRates, then: completion)
    }
}
