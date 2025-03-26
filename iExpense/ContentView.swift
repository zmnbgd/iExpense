//
//  ContentView.swift
//  iExpense
//
//  Created by Marko Zivanovic on 13.3.25..
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

struct ContentView: View {
    
    @State private var expenses = Expenses()
    @State private var showAddExpense = false
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
//                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5.0)
//                    expenses.items.append(expense)
                    showAddExpense = true
                }
            }
            .sheet(isPresented: $showAddExpense) {
                //MARK: - Show Add View
                AddView(expenses: expenses)
            }
        }
    }
    
    //MARK: - Removing index set of items
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

#Preview {
    ContentView()
}
