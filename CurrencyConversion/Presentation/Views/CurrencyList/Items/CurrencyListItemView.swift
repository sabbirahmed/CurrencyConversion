//
//  CurrencyListItem.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 2/8/22.
//

import SwiftUI

struct CurrencyListItemView: View {
    var item: Currency
    var itemClickEvent: (Currency) -> Void

    var body: some View {
        HStack {
            Text(item.code).foregroundColor(.blue)
            Spacer()
            Text(item.countryName).foregroundColor(.blue)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            itemClickEvent(item)
        }
    }
}
