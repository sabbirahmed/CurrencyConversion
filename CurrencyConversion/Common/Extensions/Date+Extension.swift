//
//  Date+Extension.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 6/8/22.
//

import Foundation

extension Date {
    
    func to(timeZone outputTimeZone: TimeZone, from inputTimeZone: TimeZone) -> Date {
        let delta = TimeInterval(outputTimeZone.secondsFromGMT(for: self) - inputTimeZone.secondsFromGMT(for: self))
        return addingTimeInterval(delta)
    }
}
