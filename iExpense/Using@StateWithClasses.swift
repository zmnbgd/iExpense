//
//  Using@StateWithClasses.swift
//  iExpense
//
//  Created by Marko Zivanovic on 14.3.25..
//

import SwiftUI

//struct User {
//    var firstName = "Bilbo"
//    var lastName = "Baggins"
//}

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}


struct Using_StateWithClasses: View {
    
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

#Preview {
    Using_StateWithClasses()
}
