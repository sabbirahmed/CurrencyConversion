//
//  ConversionUseCase.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 4/8/22.
//

import Foundation
import SwiftUI

class ConversionUseCase {
    private let conversionRepository: ConversionRepository
    
    init() {
        conversionRepository = ApiConversionRepository()
    }
    
    deinit { }
    
    func conversionRate(inputValue: Decimal, completion: @escaping(_ result: [ConversionRate]?) -> Void) {
        if let latestConvertion = UserPreference().latestConversionRate {
            if isLoadRate(lastLodingTime: latestConvertion.timestamp) {
                updateNewRate()
                completion(getData(inputValue: inputValue, data: UserPreference().latestConversionRate!.rates))
            } else {
                completion(getData(inputValue: inputValue, data: latestConvertion.rates))
            }
        } else {
            updateNewRate()
            completion(getData(inputValue: inputValue, data: UserPreference().latestConversionRate!.rates))
        }
    }
    
    private func updateNewRate() {
        conversionRepository.fetchConversionRate { result in
            switch result {
            case .success(let data):
                if let response = try? JSONDecoder().decode(LatestRates.self, from: data) {
                    UserPreference().latestConversionRate = response
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    private func isLoadRate(lastLodingTime: Double) -> Bool {
        let currentTime = Date().to(timeZone: TimeZone(identifier: "GMT")!, from: TimeZone(identifier: "GMT")!)
        let lodingIntervelTime: Double = 30 * 60
        let lastDurationLodingTime = currentTime.timeIntervalSince1970 - lastLodingTime

        if lastDurationLodingTime > lodingIntervelTime {
            return true
        } else {
            return false
        }
    }
    
    private func getData(inputValue: Decimal, data: [String: Decimal]) -> [ConversionRate]? {
        var currencyList = [ConversionRate]()
        
        guard let currencyRate = data[UserPreference().selectedCurrencyCode] else { return nil }
        let converSionRate = rateCalculation(inputValue: inputValue, currencyRate: currencyRate)
        
        for (key, value) in data {
            if UserPreference().selectedCurrencyCode != key {
                currencyList.append(ConversionRate(code: key, rate: "\(value * converSionRate)"))
            }
        }
        
        return currencyList
    }
    
    private func rateCalculation(inputValue: Decimal, currencyRate: Decimal) -> Decimal {
        return inputValue / currencyRate
    }
}
