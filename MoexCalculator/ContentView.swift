//
//  ContentView.swift
//  MoexCalculator
//
//  Created by kamila on 05.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State var color = Color.green
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
            Text("Привет, Практикум!")
                .padding()
                .foregroundColor(color)      // 2
            Button("Нажми здесь!") {         // 3
                if color == .green {
                    color = .orange
                } else {
                    color = .green
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
