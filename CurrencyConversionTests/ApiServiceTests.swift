//
//  ApiServiceTests.swift
//  CurrencyConversionTests
//
//  Created by Sabbir Ahmed on 6/8/22.
//

import XCTest
@testable import CurrencyConversion

class ApiServiceTests: XCTestCase {
    let currencyUseCase = CurrencyUseCase()
    let conversionUseCase = ConversionUseCase()
    
    func testCurrencyListDataFetch() {
        currencyUseCase.currencyList { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testConversionDataFetch() {
        let inputValue: Decimal = 6000.00
        
        conversionUseCase.conversionRate(inputValue: inputValue) { result in
            XCTAssertNotNil(result)
        }
    }
}
