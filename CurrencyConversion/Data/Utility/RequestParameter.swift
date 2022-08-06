//
//  RequestParameter.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 3/8/22.
//

import Foundation

/// Protocol that defines attributes of a request parameter state machine.
public protocol RequestParameter {
    
    /// The path for the given parameter, used as the key in the parameter value.
    var key: String { get }
    
    /// The parameter used when constructing a parameter array.
    var value: Any { get }
}

extension Array where Element == RequestParameter {
    
    /// Returns a JSON object from request parameters.
    ///
    /// - Returns: [String: Any]
    func toJSON() -> [String: Any] {
        
        // Create the list parameters dictionary to be returned and used in the request.
        var json: [String: Any] = [:]
        
        // Add each parameter from the given parameters dictionary to the list parameters dictionary to be used in the request.
        for parameter in self {
            json[parameter.key] = parameter.value
        }
        
        return json
    }
}
