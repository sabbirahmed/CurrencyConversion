//
//  BaseAPIProtocol.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 3/8/22.
//

import Foundation

protocol BaseAPIProtocol {
    var method: HTTPMethod { get }
    var baseURL: String { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    var parameters: [RequestParameter]? { get }
}

extension BaseAPIProtocol {
    var baseURL: String {
        return APIConstants.baseURL
    }
}

protocol BaseRequestProtocol: BaseAPIProtocol {

}

extension BaseRequestProtocol {
    
    func asURLRequest() -> URLRequest {
        var urlRequest = URLRequest(url: getFullUrl())
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers ?? [String: String]()
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = encode(with: parameters)
        
        return urlRequest
    }
    
    private func getFullUrl() -> URL {
        
        var components = URLComponents(string: baseURL)
        components?.path = path
        
        if let query = queryItems {
            components?.queryItems = query
        }
        
        return (components?.url)!
    }
    
    private func encode(with parameters: [RequestParameter]?) -> Data? {

        guard let safeParameters: [RequestParameter] = parameters else {
            return nil
        }
        
        return try? JSONSerialization.data(withJSONObject: safeParameters.toJSON())
    }
}
