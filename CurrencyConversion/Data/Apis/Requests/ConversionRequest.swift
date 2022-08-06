//
//  ConversionRequest.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 4/8/22.
//

import Foundation

enum ConversionRequest: BaseRequestProtocol {
    case getLatestRates
    
    var method: HTTPMethod {
        switch self {
        case .getLatestRates:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getLatestRates:
            return APIConstants.latest.path
        }
    }
    
    var parameters: [RequestParameter]? {
        switch self {
        case .getLatestRates:
            return nil
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getLatestRates:
            return [URLQueryItem(name: "app_id", value: APIConstants.appId)]
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getLatestRates:
            return APIConstants.header
        }
    }
}
