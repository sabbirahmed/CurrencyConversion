//
//  CurrencyRequest.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 4/8/22.
//

import Foundation

enum CurrencyRequest: BaseRequestProtocol {
    case currencyList
    
    var method: HTTPMethod {
        switch self {
        case .currencyList:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .currencyList:
            return APIConstants.currencies.path
        }
    }
    
    var parameters: [RequestParameter]? {
        switch self {
        case .currencyList:
            return nil
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .currencyList:
            return nil
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .currencyList:
            return APIConstants.header
        }
    }
}
