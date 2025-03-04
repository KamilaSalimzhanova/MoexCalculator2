//
//  CurrencyPicker.swift
//  MoexCalculator
//
//  Created by kamila on 05.03.2025.
//

import SwiftUI

struct CurrencyPicker: View {
    @Binding var currency: Currency
    
    let onChange: (Currency) -> Void
    
    var body: some View {
        Picker("", selection: $currency) {
            ForEach(Currency.allCases) { currency in
                Text(currency.rawValue.uppercased())
            }
        }.pickerStyle(.wheel)
        .onChange(of: currency, perform: onChange)
    }
}

struct CurrencyPicker_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyPicker(currency: .constant(.RUR), onChange: {_ in})
    }
}
