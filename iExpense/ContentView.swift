//
//  ContentView.swift
//  iExpense
//
//  Created by Marko Zivanovic on 13.3.25..
//

import SwiftUI

//MARK: - Challenge: 2. Modify the expense amounts in ContentView to contain some styling depending on their value – expenses under $10 should have one style, expenses under $100 another, and expenses over $100 a third style. What those styles are depend on you.

//MARK: Custom Text Modifier
struct FontColorModifier: ViewModifier {
    var amount: Double
    func body(content: Content) -> some View {
        content.foregroundColor(colorOption(amount))
    }
}

func colorOption(_ amount: Double) -> Color {
    if amount < 10.0 {
        return .green
    } else if amount < 100.0 {
        return .blue
    } else {
        return .red
    }
}

//MARK: Custom Modifier Extension
extension View {
    func appFontColor(for amount: Double) -> some View {
        self.modifier(FontColorModifier(amount: amount))
    }
}

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
                    //Text(item.name)
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                                .appFontColor(for: item.amount)
                            Text(item.type)
                            
                        }
                        
                        Spacer()
                        //MARK: - Challenge - 1. Use the user’s preferred currency, rather than always using US dollars.
                        Text(item.amount, format: .currency(code: "RSD"))
                    }
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
