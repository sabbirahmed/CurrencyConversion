//
//  ConversionView.swift
//  CurrencyConversion
//
//  Created by Sabbir Ahmed on 2/8/22.
//

import SwiftUI

struct ConversionView: View {
    @ObservedObject var vm = ConversionViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .trailing) {
                TextField("", text: $vm.data.inputAmount)
                    .themeStyle()
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numbersAndPunctuation)
                    .onSubmit {
                        if vm.validateInputs() {
                            vm.convertAmount()
                            let formatter = DateFormatter()
                            formatter.timeZone = TimeZone(abbreviation: "GMT")
                            let currentTime = formatter.string(from: Date())
                            debugPrint(currentTime)
                        }
                    }
                    .alert(isPresented: $vm.data.isPresentingErrorAlert, content: {
                        Alert(title: Text("Alert"), message: Text(vm.data.errorMessage), dismissButton: .cancel(Text("Ok")))
                    })
                
                NavigationLink(destination: CurrencyListView(), isActive: $vm.data.navigate) {
                    
                    Button(action: onSelectCurrency) {
                        HStack {
                            Text(UserPreference().selectedCurrencyCode)
                                .onChange(of: UserPreference().selectedCurrencyCode, perform: { newValue in
                                    if vm.validateInputs() {
                                        vm.convertAmount()
                                    }
                                })
                                .font(Font.system(size: 20))
                                .padding(8)
                            
                            Image("down_arrow")
                                .resizable()
                                .scaledToFit()
                                .colorMultiply(.blue)
                                .frame(width: 32, height: 32, alignment: .center)
                                .padding(4)
                        }
                    }
                }
                
                Form {
                    List(
                        vm.data.conversionRates,
                        id: \.code ) {
                            ConversionItemView(item: $0)
                        }.listRowBackground(Color("ColorBackground"))
                }
            }
            .padding(16)
            .navigationBarHidden(true)
        }
    }
    
    func onSelectCurrency() {
        vm.data.navigate = true
    }
}

struct ConversionView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionView()
    }
}
