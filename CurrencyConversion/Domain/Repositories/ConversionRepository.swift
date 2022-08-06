//
//  ConversionRepository.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 4/8/22.
//

import Foundation

protocol ConversionRepository {
    func fetchConversionRate(completion: @escaping(_ result: APIResult) -> Void)
}
