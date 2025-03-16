//
//  SharingSwiftUIStateWith@Observable.swift
//  iExpense
//
//  Created by Marko Zivanovic on 16.3.25..
//

import Observation
import SwiftUI

@Observable
class User2 {
    var secondName = "Darth"
    var secondlastName = "Skywalker"
}

struct SharingSwiftUIStateWith_Observable: View {
    
    @State private var user2 = User2()
    
    var body: some View {

        VStack {
            Text("Your name is: \(user2.secondName) \(user2.secondlastName)")
            
            TextField("Second Name", text: $user2.secondName)
            TextField("Second Last Name", text: $user2.secondlastName)
        }
        
    }
}

#Preview {
    SharingSwiftUIStateWith_Observable()
}
