//
//  UserStorageTests.swift
//  CurrencyConversionTests
//
//  Created by Sabbir Ahmed on 6/8/22.
//

import XCTest
@testable import CurrencyConversion

class UserStorageTests: XCTestCase {
    let userDefaults = UserPreference()
    let countryCode = "AED"
    let latestConersionRate = LatestRates(disclaimer: "Usage subject to terms: https://openexchangerates.org/terms",
                                          license: "https://openexchangerates.org/license",
                                          timestamp: 1659801606,
                                          base: "USD",
                                          rates: [
                                            "AED": 3.6731,
                                            "AFN": 90.980507,
                                            "ALL": 114.793557,
                                            "AMD": 408.396057,
                                            "ANG": 1.811558,
                                            "AOA": 431.1421,
                                            "ARS": 133.335157,
                                            "AUD": 1.44707,
                                            "AWG": 1.8025
                                          ])
    let currencyList = [
        "AED": "United Arab Emirates Dirham",
        "AFN": "Afghan Afghani",
        "ALL": "Albanian Lek",
        "AMD": "Armenian Dram",
        "ANG": "Netherlands Antillean Guilder",
        "AOA": "Angolan Kwanza",
        "ARS": "Argentine Peso",
        "AUD": "Australian Dollar",
        "AWG": "Aruban Florin"
    ]
    
    func testSelectCountryCodeSaveToStorage() {
        userDefaults.selectedCurrencyCode = countryCode
        
        XCTAssertNotNil(userDefaults.selectedCurrencyCode)
    }
    
    func testLatestConversionRateSaveToStorage() {
        userDefaults.latestConversionRate = latestConersionRate
        
        XCTAssertNotNil(userDefaults.latestConversionRate)
    }
    
    func testCurrencyListSaveToStorage() {
        userDefaults.currencyList = currencyList
        
        XCTAssertNotNil(userDefaults.currencyList)
    }
}
