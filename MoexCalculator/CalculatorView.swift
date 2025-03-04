//
//  CalculatorView.swift
//  MoexCalculator
//
//  Created by kamila on 05.03.2025.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject var viewModel: CalculatorViewModel
    @State private var isPickerPresented = true
    
    var body: some View {
        NavigationStack {
            List {
                CurrencyInput(currency: viewModel.topCurrency, amount: viewModel.topAmount, calculator: viewModel.setTopAmount, tapHandler: {isPickerPresented.toggle()})
                CurrencyInput(currency: viewModel.bottomCurrency, amount: viewModel.bottomAmount, calculator: viewModel.setBottomAmount, tapHandler: {isPickerPresented.toggle()})
            }
            .onTapGesture {
                hideKeyboard()
            }
            .sheet(isPresented: $isPickerPresented, content: {
                VStack(spacing: 16) {
                    Spacer()
                    RoundedRectangle(cornerRadius: 3).fill(.secondary).frame(width: 60, height: 6)
                        .onTapGesture {
                            isPickerPresented = false
                        }
                    HStack {
                        VStack(spacing: -30) {
                            Text("From").font(.title).fontWeight(.semibold)
                            CurrencyPicker(currency: $viewModel.topCurrency, onChange: {_ in didChangeTopCurrency()})
                        }
                        VStack(spacing: -30) {
                            Text("To").font(.title).fontWeight(.semibold)
                            CurrencyPicker(currency: $viewModel.bottomCurrency, onChange: { _ in didChangeBottomCurrency()})
                        }
                    }.presentationDetents([.fraction(0.3)])
                }
            }).navigationTitle("Currency Converter")
            
            NavigationLink("Show Affirmation", destination: AffirmationView())
                .font(.headline)
                .foregroundColor(.black)
                .backgroundStyle(.thinMaterial)
            
        }
    }
    
    private func didChangeTopCurrency() {
        viewModel.updateTopAmount()
    }
    private func didChangeBottomCurrency() {
        viewModel.updateBottomAmount()
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .environmentObject(CalculatorViewModel())
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
