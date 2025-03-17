//
//  ShowingAndHidingViews.swift
//  iExpense
//
//  Created by Marko Zivanovic on 17.3.25..
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
//        Text("Second View")
//        Text("Hello, \(name)")
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ShowingAndHidingViews: View {
    
    @State private var showingSheet = false
    
    
    var body: some View {
        Button("Show the sheet") {
            //MARK: - Show the sheet
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            //MARK: - Contents of sheet
            SecondView(name: "Luke Skaywalker")
        }
    }
}

#Preview {
    ShowingAndHidingViews()
}
