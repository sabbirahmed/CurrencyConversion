//
//  ApiResponse.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 3/8/22.
//

import Foundation

enum APIResult {
    case success(Data)
    case failure(Error)
}
