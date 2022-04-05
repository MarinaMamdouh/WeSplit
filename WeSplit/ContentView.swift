//
//  ContentView.swift
//  WeSplit
//
//  Created by Marina on 05/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let percentages = [0, 10 , 15, 20]
    
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipValue = checkAmount * Double(tipPercentage/100)
        let totalAmount  = checkAmount + tipValue
        return totalAmount / Double(peopleCount)
    }
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"), prompt: nil)
                        .keyboardType(.decimalPad)
                
                }
                Section{
                    Picker(selection: $numberOfPeople) {
                        ForEach(2..<100) { n in
                            Text("\(n) People")
                        }
                    } label: {
                        Text("Number Of People")
                    }

                }
                Section{
                    
                    Picker(selection: $tipPercentage) {
                        ForEach(percentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    } label: {
                        Text("Tip percentage")
                    }
                    .pickerStyle(.segmented)

                } header: {
                    Text("How much tip?")
                }
                Section{
                    Text("Amount per person: \(totalPerPerson)")
                }
            }.navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
