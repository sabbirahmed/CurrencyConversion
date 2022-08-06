//
//  TextField+Extension.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 2/8/22.
//

import SwiftUI

extension TextField {
    
    func themeStyle() -> some View {
        self
            .padding(8)
            .background(.background)
            .border(.gray)
    }
}
