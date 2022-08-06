//
//  UserPreference.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 2/8/22.
//

import Foundation

class UserPreference: ObservableObject {
    private let defaults = UserDefaults.standard
    
    init() {
        self.selectedCurrencyCode = defaults.string(forKey: UserDefaultsKeys.selectedCurrencyCode.rawValue) ?? "USD"
    }
    
    //MARK: Currency Code
    @Published var selectedCurrencyCode: String {
        didSet {
            defaults.set(selectedCurrencyCode, forKey: UserDefaultsKeys.selectedCurrencyCode.rawValue)
        }
    }
    
    //MARK: Latest conversion rate
    var latestConversionRate: LatestRates? {
        set {
            do {
                // Create JSON Encoder
                let encoder = JSONEncoder()
                
                // Encode Note
                let data = try encoder.encode(newValue)
                
                // Write/Set Data
                defaults.set(data, forKey: UserDefaultsKeys.latestConversionRate.rawValue)
                
            } catch {
                debugPrint("Unable to Encode UserAuthEntity (\(error))")
            }
        }
        get {
            if let data = UserDefaults.standard.data(forKey: UserDefaultsKeys.latestConversionRate.rawValue) {
                do {
                    // Create JSON Decoder
                    let decoder = JSONDecoder()
                    
                    // Decode Note
                    return try decoder.decode(LatestRates.self, from: data)
                    
                } catch {
                    debugPrint("Unable to Decode UserAuthEntity (\(error))")
                    return nil
                }
            }
            return nil
        }
    }
    
    //MARK: Currency list
    var currencyList: [String: String]? {
        set {
            do {
                // Create JSON Encoder
                let encoder = JSONEncoder()
                
                // Encode Note
                let data = try encoder.encode(newValue)
                
                // Write/Set Data
                defaults.set(data, forKey: UserDefaultsKeys.currencyList.rawValue)
                
            } catch {
                debugPrint("Unable to Encode UserAuthEntity (\(error))")
            }
        }
        get {
            if let data = UserDefaults.standard.data(forKey: UserDefaultsKeys.currencyList.rawValue) {
                do {
                    // Create JSON Decoder
                    let decoder = JSONDecoder()
                    
                    // Decode Note
                    return try decoder.decode([String: String].self, from: data)
                    
                } catch {
                    debugPrint("Unable to Decode UserAuthEntity (\(error))")
                    return nil
                }
            }
            return nil
        }
    }
    
}
