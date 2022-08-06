//
//  ConversionItemView.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 2/8/22.
//

import SwiftUI

struct ConversionItemView: View {
    
    var item: ConversionRate

    var body: some View {
        HStack {
            Text(item.code).foregroundColor(.black)
            Spacer()
            Text(item.rate).foregroundColor(.black)
            
        }
        .contentShape(Rectangle())
    }
}
