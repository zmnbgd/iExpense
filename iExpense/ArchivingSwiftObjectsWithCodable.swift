//
//  ArchivingSwiftObjectsWithCodable.swift
//  iExpense
//
//  Created by Marko Zivanovic on 20.3.25..
//

import SwiftUI

struct User3 {
    var name: String
    var lastName: String
}

struct ArchivingSwiftObjectsWithCodable: View {
    
    @State private var user3 = User3(name: "Darth", lastName: "Wader")
    
    var body: some View {
        Button("Save user") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user3) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    ArchivingSwiftObjectsWithCodable()
}
