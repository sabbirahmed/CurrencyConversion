//
//  CurrencyListView.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 2/8/22.
//

import SwiftUI

struct CurrencyListView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm = CurrencyListViewModel()
    
    init() {
        vm.currencyList()
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .trailing) {
                Form {
                    List(
                        vm.data.currencyList,
                        id: \.code ) {
                        CurrencyListItemView(item: $0, itemClickEvent: { item in
                            vm.itemClickEvent(item: item)
                            if vm.data.navigate == true {
                                dismiss()
                            }
                        })
                    }.listRowBackground(Color("ColorBackground"))
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct CurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyListView()
    }
}
