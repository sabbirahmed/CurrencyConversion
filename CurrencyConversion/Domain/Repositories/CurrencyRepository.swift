//
//  CurrencyRepository.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 4/8/22.
//

import Foundation

protocol CurrencyRepository {
    func fetchCurrencys(completion: @escaping(_ result: APIResult) -> Void)
}
