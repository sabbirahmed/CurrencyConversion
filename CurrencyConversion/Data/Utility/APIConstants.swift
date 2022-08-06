//
//  APIConstants.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 3/8/22.
//

import Foundation

protocol BaseAPIConstants {
    var path: String { get }
}

enum APIConstants {
    public static let unauthorizedErrorCode = 401
    
    public static var baseURL = "https://openexchangerates.org"
    public static var appId = "88023b1c78a44463b73a910237a3dcc3"
    
    public static var header: [String: String]? {
        return nil
    }
    
    case latest
    case currencies
    
    public var path: String {
        switch self {
        case .latest: return "/api/latest.json"
        case .currencies: return "/api/currencies.json"
        }
    }
}
