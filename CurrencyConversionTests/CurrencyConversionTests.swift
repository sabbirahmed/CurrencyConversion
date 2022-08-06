//
//  CurrencyConversionTests.swift
//  CurrencyConversionTests
//
//  Created by Sabbir Ahmed on 2/8/22.
//

import XCTest
@testable import CurrencyConversion

class CurrencyConversionTests: XCTestCase {
    
    func testValidInputValue() {
        XCTAssertTrue(AmountInputValidation().inputValue(value: "475685934.9999").success)
    }
    
    func testInvalidInputValue() {
        XCTAssertTrue(AmountInputValidation().inputValue(value: "").success)
        XCTAssertTrue(AmountInputValidation().inputValue(value: "kjkjhgftyyh.ytfgfhh").success)
    }

}
