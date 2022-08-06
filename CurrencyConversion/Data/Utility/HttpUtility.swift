//
//  HttpUtility.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 3/8/22.
//

import Foundation

final class HttpUtility {
    static let shared = HttpUtility()
    private init(){}
    
    func create<T>(request: T, then completion:@escaping (APIResult) -> Void) where T: BaseRequestProtocol {
        
        URLSession.shared.dataTask(with: request.asURLRequest()) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else {
                if let data = data {
                    completion(.success(data))
                } else {
                    let error = NSError(domain: "com.sabbirahmed", code: 404, userInfo: [NSLocalizedDescriptionKey : "Data does not have value"])
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
