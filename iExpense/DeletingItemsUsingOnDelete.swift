//
//  DeletingItemsUsingOnDelete.swift
//  iExpense
//
//  Created by Marko Zivanovic on 18.3.25..
//

import SwiftUI

struct DeletingItemsUsingOnDelete: View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                Button("Add row") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
    
}

#Preview {
    DeletingItemsUsingOnDelete()
}
