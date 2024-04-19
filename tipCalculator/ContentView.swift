//
// ContentView.swift
// tipCalculator
//
// Created by Erencan Toprak on 2024-03-14.
//

import SwiftUI

struct ContentView: View {
    
    @State private var billAmount = ""
    @State private var tipPercentage = 15.0
   
    var tipAmount: Double{
        let bill = Double(billAmount) ?? 0
        return bill * tipPercentage / 100
    }
    
    var totalAmount: Double {
        let bill = Double(billAmount) ?? 0
        return bill + tipAmount
    }
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter bill amount", text: $billAmount).keyboardType(.decimalPad).padding()
                
                HStack {
                    Text("Tip: \(Int(tipPercentage))%")
                    
                    Slider(value: $tipPercentage, in: 0...30, step: 1).accentColor(.blue)
                }.padding()
                Divider()
                Text("Tip Amount: $\(tipAmount, specifier: "%.2f")")
                Text("Total Amount: $\(totalAmount, specifier: "%.2f")")
                
                Spacer()
                
                Text("Made by Erencan").font(.footnote).foregroundColor(.gray).padding(.bottom)
            }.navigationTitle("Tip Calculator").padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

