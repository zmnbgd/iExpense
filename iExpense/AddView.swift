//
//  AddView.swift
//  iExpense
//
//  Created by Marko Zivanovic on 25.3.25..
//

import SwiftUI

struct AddView: View {
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount: Double = 0.0
    
    var expenses: Expenses
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
